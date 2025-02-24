import 'package:skansapung_presensi/core/constant/constant.dart';
import 'package:skansapung_presensi/core/network/data_state.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_service.g.dart';

@JsonSerializable()
class AuthResponse {
    final bool success;
    final String message;
    final String? token;
    final Map<String, dynamic>? user;

    AuthResponse({
        required this.success,
        required this.message,
        this.token,
        this.user,
    });

    factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
    Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@RestApi(baseUrl: BASE_URL)
abstract class AuthApiService {
    factory AuthApiService(Dio dio) = _AuthApiService;

    @POST('/api/login')
    Future<AuthResponse> login(@Body() Map<String, dynamic> body);
}
