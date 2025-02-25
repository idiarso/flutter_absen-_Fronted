import 'dart:convert';
import 'dart:io';

import 'package:skansapung_presensi/core/network/base_response.dart';
import 'package:skansapung_presensi/core/helper/error_handler.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

class DataState<T> extends BaseResponse {
  final T? data;
  DataState({required super.success, required super.message, this.data});

  factory DataState.fromJson(Map<String, dynamic> json) {
    return DataState(
        success: json['success'],
        message: json['message'] ?? '',
        data: json['data']);
  }
}

class SuccessState<T> extends DataState<T> {
  SuccessState({T? data, String message = 'Success'})
      : super(success: true, message: message, data: data);
}

class ErrorState<T> extends DataState<T> {
  ErrorState({required String message})
      : super(success: false, message: message);
  factory ErrorState.fromJson(Map<String, dynamic> json) {
    return ErrorState(message: json['message']);
  }
}

Future<DataState<T>> handleResponse<T>(
    Future<HttpResponse<DataState>> Function() apiCall,
    T Function(dynamic) mapDataSuccess) async {
  try {
    final HttpResponse<DataState> httpResponse = await apiCall();
    if (httpResponse.response.statusCode == HttpStatus.ok) {
      final response = httpResponse.data;
      if (response.success) {
        return SuccessState(
            message: response.message, data: mapDataSuccess(response.data));
      } else {
        return ErrorState(message: response.message);
      }
    } else {
      throw DioException(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions);
    }
  } catch (e) {
    if (e is DioException) {
      try {
        final response = ErrorState.fromJson(jsonDecode(e.response.toString()));
        return ErrorState(message: AppErrorHandler.handleError(e));
      } catch (_) {
        return ErrorState(message: AppErrorHandler.handleError(e));
      }
    }
    return ErrorState(message: AppErrorHandler.handleError(e));
  }
}
