import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';
import '../models/jurnal_pkl_model.dart';

part 'pkl_api_service.g.dart';

@JsonSerializable()
class PKLLocation {
    final int id;
    final String name;
    final String address;
    final String? description;
    final int capacity;
    final int currentStudents;

    PKLLocation({
        required this.id,
        required this.name,
        required this.address,
        this.description,
        required this.capacity,
        required this.currentStudents,
    });

    factory PKLLocation.fromJson(Map<String, dynamic> json) => _$PKLLocationFromJson(json);
    Map<String, dynamic> toJson() => _$PKLLocationToJson(this);
}

@JsonSerializable()
class PKLStudent {
    final int id;
    final String name;
    final String nis;
    final String kelas;
    final String? lokasi;
    final String? pembimbing;
    final DateTime? startDate;
    final DateTime? endDate;

    PKLStudent({
        required this.id,
        required this.name,
        required this.nis,
        required this.kelas,
        this.lokasi,
        this.pembimbing,
        this.startDate,
        this.endDate,
    });

    factory PKLStudent.fromJson(Map<String, dynamic> json) => _$PKLStudentFromJson(json);
    Map<String, dynamic> toJson() => _$PKLStudentToJson(this);
}

@JsonSerializable()
class PKLProgress {
    final int totalDays;
    final int completedDays;
    final double progressPercentage;
    final Map<String, int> attendanceByMonth;

    PKLProgress({
        required this.totalDays,
        required this.completedDays,
        required this.progressPercentage,
        required this.attendanceByMonth,
    });

    factory PKLProgress.fromJson(Map<String, dynamic> json) => _$PKLProgressFromJson(json);
    Map<String, dynamic> toJson() => _$PKLProgressToJson(this);
}

@RestApi()
abstract class PKLApiService {
    factory PKLApiService(Dio dio, {String baseUrl}) = _PKLApiService;

    @GET('/api/pkl/jurnal')
    Future<List<JurnalPKL>> getJurnalList({
        @Query('search') String? search,
        @Query('status') String? status,
        @Query('start_date') String? startDate,
        @Query('end_date') String? endDate,
    });

    @POST('/api/pkl/jurnal')
    @MultiPart()
    Future<void> submitJurnal({
        @Part(name: 'kegiatan') required String kegiatan,
        @Part(name: 'lokasi') required String lokasi,
        @Part(name: 'dokumentasi') required List<int> dokumentasi,
        @Part(name: 'filename') required String filename,
    });

    @GET('/api/pkl/locations')
    Future<List<PKLLocation>> getLocations();

    @GET('/api/pkl/student')
    Future<PKLStudent> getStudentPKL();

    @GET('/api/pkl/progress')
    Future<PKLProgress> getProgress();

    @GET('/api/pkl/jurnal/{id}')
    Future<JurnalPKL> getJurnalDetail(@Path('id') int id);

    @PUT('/api/pkl/jurnal/{id}/status')
    Future<void> updateJurnalStatus(
        @Path('id') int id,
        @Field('status') String status,
        @Field('catatan') String? catatan,
    );
}
