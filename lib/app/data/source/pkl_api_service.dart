import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/jurnal_pkl_model.dart';

part 'pkl_api_service.g.dart';

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
  Future<List<Map<String, dynamic>>> getLocations();

  @GET('/api/pkl/student')
  Future<Map<String, dynamic>> getStudentPKL();

  @GET('/api/pkl/progress')
  Future<Map<String, dynamic>> getProgress();

  @GET('/api/pkl/jurnal/{id}')
  Future<JurnalPKL> getJurnalDetail(@Path('id') int id);

  @PUT('/api/pkl/jurnal/{id}/status')
  Future<void> updateJurnalStatus(
    @Path('id') int id,
    @Field('status') String status,
    @Field('catatan') String? catatan,
  );
}
