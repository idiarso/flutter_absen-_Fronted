/// DataState Class - Core Data State Handler
///
/// Last Modified: 2023-10-11
/// Contributors: Claude
///
/// Changes:
/// - Fixed import conflicts with network/data_state.dart
/// - Added proper type parameters to DataSuccess and DataFailed
/// - Enhanced error handling for API responses
/// - Added support for better null safety handling
///
/// Usage Notes:
/// - This should be the primary DataState implementation used across repositories
/// - All repositories should use this implementation to maintain consistency

abstract class DataState<T> {
  final T? data;
  final String? message;
  final int? statusCode;

  const DataState({this.data, this.message, this.statusCode});

  // Getter for error message
  String? get error => message;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(String message, [int? statusCode])
    : super(message: message, statusCode: statusCode);
}
