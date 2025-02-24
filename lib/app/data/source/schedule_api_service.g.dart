// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_api_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
  id: (json['id'] as num).toInt(),
  day: json['day'] as String,
  startTime: json['startTime'] as String,
  endTime: json['endTime'] as String,
  subject: json['subject'] as String,
  teacher: json['teacher'] as String?,
  room: json['room'] as String?,
);

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
  'id': instance.id,
  'day': instance.day,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'subject': instance.subject,
  'teacher': instance.teacher,
  'room': instance.room,
};

ScheduleResponse _$ScheduleResponseFromJson(Map<String, dynamic> json) =>
    ScheduleResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      schedules:
          (json['schedules'] as List<dynamic>)
              .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ScheduleResponseToJson(ScheduleResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'schedules': instance.schedules,
    };

BannedResponse _$BannedResponseFromJson(Map<String, dynamic> json) =>
    BannedResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      isBanned: json['isBanned'] as bool,
      reason: json['reason'] as String?,
      bannedUntil:
          json['bannedUntil'] == null
              ? null
              : DateTime.parse(json['bannedUntil'] as String),
    );

Map<String, dynamic> _$BannedResponseToJson(BannedResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'isBanned': instance.isBanned,
      'reason': instance.reason,
      'bannedUntil': instance.bannedUntil?.toIso8601String(),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _ScheduleApiService implements ScheduleApiService {
  _ScheduleApiService(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://app.sijasmkn1punggelan.org';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ScheduleResponse> get() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ScheduleResponse>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/get-schedule',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ScheduleResponse _value;
    try {
      _value = ScheduleResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BannedResponse> banned() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BannedResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/banned',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BannedResponse _value;
    try {
      _value = BannedResponse.fromJson(_result.data!);
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
