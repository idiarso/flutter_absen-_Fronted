// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_api_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceRecord _$AttendanceRecordFromJson(Map<String, dynamic> json) =>
    AttendanceRecord(
      id: (json['id'] as num).toInt(),
      userId: json['userId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      type: json['type'] as String,
      status: json['status'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$AttendanceRecordToJson(AttendanceRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': instance.type,
      'status': instance.status,
      'notes': instance.notes,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _AttendanceApiService implements AttendanceApiService {
  _AttendanceApiService(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://app.sijasmkn1punggelan.org';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<AttendanceResponse> getAttendanceToday() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<AttendanceResponse>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/get-attendance-today',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AttendanceResponse _value;
    try {
      _value = AttendanceResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<HttpResponse<AttendanceResponse>> sendAttendance({
    required Map<String, dynamic> body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options = _setStreamType<HttpResponse<AttendanceResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/attendance/submit',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AttendanceResponse _value;
    try {
      _value = AttendanceResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<List<AttendanceRecord>> getAttendanceByMonthYear(
    String month,
    String year,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<AttendanceRecord>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/get-attendance-by-month-year/${month}/${year}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<AttendanceRecord> _value;
    try {
      _value =
          _result.data!
              .map(
                (dynamic i) =>
                    AttendanceRecord.fromJson(i as Map<String, dynamic>),
              )
              .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
