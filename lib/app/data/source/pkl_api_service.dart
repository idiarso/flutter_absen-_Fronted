import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/jurnal_pkl_model.dart';

part 'pkl_api_service.g.dart';

@RestApi()
abstract class PKLApiService {
  factory PKLApiService(Dio dio, {String baseUrl}) = _PKLApiService;

  @GET('/api/pkl/jurnal')
  Future<List<JurnalPKL>> getJurnalList();

  @POST('/api/pkl/jurnal')
  Future<void> submitJurnal({
    @Field('kegiatan') required String kegiatan,
    @Field('lokasi') required String lokasi,
    @Field('image_path') required String imagePath,
  });

  @GET('/api/pkl/locations')
  Future<List<Map<String, dynamic>>> getLocations();

  @GET('/api/pkl/student')
  Future<Map<String, dynamic>> getStudentPKL();

  @GET('/api/pkl/progress')
  Future<Map<String, dynamic>> getProgress();
}
