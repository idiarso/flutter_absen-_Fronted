import 'dart:io';
import 'package:dio/dio.dart';

class AppErrorHandler {
  static String handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return 'Connection timeout. Please check your internet connection.';
        case DioExceptionType.sendTimeout:
          return 'Request timeout. Please try again.';
        case DioExceptionType.receiveTimeout:
          return 'Response timeout. Please try again.';
        case DioExceptionType.badResponse:
          return _handleResponseError(
            error.response?.statusCode,
            error.response?.data,
          );
        case DioExceptionType.cancel:
          return 'Request cancelled.';
        case DioExceptionType.connectionError:
          return 'No internet connection. Please check your network.';
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            return 'Network error. Please check your internet connection.';
          }
          return 'An unexpected error occurred. Please try again.';
        default:
          return 'An unexpected error occurred. Please try again.';
      }
    } else if (error is SocketException) {
      return 'Network error. Please check your internet connection.';
    } else if (error is FormatException) {
      return 'Invalid data format received from server.';
    } else if (error is TypeError) {
      return 'Data processing error. Please try again.';
    } else {
      return error?.toString() ?? 'An unexpected error occurred.';
    }
  }

  static String _handleResponseError(int? statusCode, dynamic responseData) {
    final defaultMessage = 'An unexpected error occurred. Please try again.';
    final message =
        responseData is Map
            ? responseData['message']?.toString() ?? defaultMessage
            : defaultMessage;

    switch (statusCode) {
      case 400:
        return message;
      case 401:
        return message;
      case 403:
        return message;
      case 404:
        return message;
      case 422:
        return message;
      case 429:
        return message;
      case 500:
        return message;
      case 502:
        return message;
      case 503:
        return message;
      case 504:
        return message;
      default:
        return message;
    }
  }
}
