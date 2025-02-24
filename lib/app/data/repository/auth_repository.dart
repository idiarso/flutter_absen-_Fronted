import 'package:skansapung_presensi/app/data/model/auth.dart';
import 'package:skansapung_presensi/app/data/source/auth_api_service.dart';
import 'package:skansapung_presensi/app/module/entity/auth.dart';
import 'package:skansapung_presensi/app/module/repository/auth_repository.dart';
import 'package:skansapung_presensi/core/constant/constant.dart';
import 'package:skansapung_presensi/core/helper/shared_preferences_helper.dart';
import 'package:skansapung_presensi/app/core/data/data_state.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState> login(AuthEntity param) async {
    try {
      final response = await _authApiService.login(param.toJson());
      if (response.data.success) {
        final authModel = AuthModel.fromJson(response.data.data);
        await SharedPreferencesHelper.setString(
            PREF_AUTH, '${authModel.tokenType} ${authModel.accessToken}');
        await SharedPreferencesHelper.setInt(PREF_ID, authModel.user.id);
        await SharedPreferencesHelper.setString(PREF_NAME, authModel.user.name);
        await SharedPreferencesHelper.setString(
            PREF_EMAIL, authModel.user.email);
        return const DataSuccess(null);
      }
      return DataFailed(response.data.message, response.response.statusCode);
    } on DioException catch (e) {
      return DataFailed(e.message ?? 'Unknown error', e.response?.statusCode ?? 500);
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }
}
