abstract class DataState<T> {
  final T? data;
  final String? message;
  final int? statusCode;

  const DataState({this.data, this.message, this.statusCode});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(String message, [int? statusCode]) 
      : super(message: message, statusCode: statusCode);
} 