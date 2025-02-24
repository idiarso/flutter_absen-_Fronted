import 'package:skansapung_presensi/core/constant/constant.dart';
import 'package:skansapung_presensi/core/network/data_state.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_api_service.g.dart';

@JsonSerializable()
class PhotoResponse {
    final bool success;
    final String message;
    final List<PhotoData> photos;

    PhotoResponse({
        required this.success,
        required this.message,
        required this.photos,
    });

    factory PhotoResponse.fromJson(Map<String, dynamic> json) => _$PhotoResponseFromJson(json);
    Map<String, dynamic> toJson() => _$PhotoResponseToJson(this);
}

@JsonSerializable()
class PhotoData {
    final int id;
    final String path;
    final String filename;
    final DateTime createdAt;

    PhotoData({
        required this.id,
        required this.path,
        required this.filename,
        required this.createdAt,
    });

    factory PhotoData.fromJson(Map<String, dynamic> json) => _$PhotoDataFromJson(json);
    Map<String, dynamic> toJson() => _$PhotoDataToJson(this);
}

@RestApi(baseUrl: BASE_URL)
abstract class PhotoApiService {
    factory PhotoApiService(Dio dio) = _PhotoApiService;

    @GET('/api/get-photo')
    Future<PhotoResponse> get();

    @GET('{path}')
    @DioResponseType(ResponseType.bytes)
    Future<List<int>> getBytes(@Path('path') String path);
}
