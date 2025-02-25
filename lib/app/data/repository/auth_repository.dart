import 'package:skansapung_presensi/app/data/model/auth.dart';
import 'package:skansapung_presensi/app/data/source/auth_api_service.dart';
import 'package:skansapung_presensi/app/module/entity/auth.dart';
import 'package:skansapung_presensi/app/module/repository/auth_repository.dart';
import 'package:skansapung_presensi/core/constant/constant.dart';
import 'package:skansapung_presensi/core/helper/shared_preferences_helper.dart';
import 'package:skansapung_presensi/core/network/data_state.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState<dynamic>> login(AuthEntity param) async {
    try {
      final response = await _authApiService.login(param.toJson());
      if (response.success) {
        final authModel = AuthModel.fromJson(response.user ?? {});
        await SharedPreferencesHelper.setString(
            PREF_AUTH, 'Bearer ${response.token}');
        await SharedPreferencesHelper.setInt(PREF_ID, authModel.user.id);
        await SharedPreferencesHelper.setString(PREF_NAME, authModel.user.name);
        await SharedPreferencesHelper.setString(
            PREF_EMAIL, authModel.user.email);
        return DataState(success: true, message: "Login successful", data: null);
      }
      return DataState(success: false, message: response.message, data: null);
    } on DioException catch (e) {
      return DataState(success: false, message: e.message ?? 'Unknown error', data: null);
    } catch (e) {
      return DataState(success: false, message: e.toString(), data: null);
    }
  }
}
