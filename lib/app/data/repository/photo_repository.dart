import 'dart:io';

import 'package:skansapung_presensi/app/data/source/photo_api_service.dart';
import 'package:skansapung_presensi/app/module/repository/photo_repository.dart';
import 'package:skansapung_presensi/core/constant/constant.dart';
import 'package:skansapung_presensi/app/core/data/data_state.dart';
import 'package:dio/dio.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  final PhotoApiService _photoApiService;

  PhotoRepositoryImpl(this._photoApiService);

  @override
  Future<DataState<String>> get() async {
    try {
      final response = await _photoApiService.get();
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e.message ?? 'Failed to load photo', e.response?.statusCode ?? 500);
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }

  @override
  Future<DataState> getBytes(String url) async {
    try {
      final response = await _photoApiService.getBytes(url.replaceAll(BASE_URL, ''));
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e.message ?? 'Failed to get bytes', e.response?.statusCode ?? 500);
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }
}
