import 'dart:io';

import 'package:skansapung_presensi/app/data/source/photo_api_service.dart';
import 'package:skansapung_presensi/app/module/repository/photo_repository.dart';
import 'package:skansapung_presensi/core/constant/constant.dart';
import 'package:skansapung_presensi/core/network/data_state.dart';
import 'package:dio/dio.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  final PhotoApiService _photoApiService;

  PhotoRepositoryImpl(this._photoApiService);

  @override
  Future<DataState<String>> get() async {
    try {
      final response = await _photoApiService.get();
      return DataState(
        success: true, 
        message: "Success", 
        data: response.photos.isNotEmpty ? response.photos[0].path + '/' + response.photos[0].filename : ""
      );
    } on DioException catch (e) {
      return DataState(success: false, message: e.message ?? 'Failed to load photo', data: null);
    } catch (e) {
      return DataState(success: false, message: e.toString(), data: null);
    }
  }

  @override
  Future<DataState<dynamic>> getBytes(String url) async {
    try {
      final response = await _photoApiService.getBytes(url.replaceAll(BASE_URL, ''));
      return DataState(success: true, message: "Success", data: response);
    } on DioException catch (e) {
      return DataState(success: false, message: e.message ?? 'Failed to get bytes', data: null);
    } catch (e) {
      return DataState(success: false, message: e.toString(), data: null);
    }
  }
}
