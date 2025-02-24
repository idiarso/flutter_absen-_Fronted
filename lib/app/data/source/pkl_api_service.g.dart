// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pkl_api_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PKLLocation _$PKLLocationFromJson(Map<String, dynamic> json) => PKLLocation(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  address: json['address'] as String,
  description: json['description'] as String?,
  capacity: (json['capacity'] as num).toInt(),
  currentStudents: (json['currentStudents'] as num).toInt(),
);

Map<String, dynamic> _$PKLLocationToJson(PKLLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'capacity': instance.capacity,
      'currentStudents': instance.currentStudents,
    };

PKLStudent _$PKLStudentFromJson(Map<String, dynamic> json) => PKLStudent(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  nis: json['nis'] as String,
  kelas: json['kelas'] as String,
  lokasi: json['lokasi'] as String?,
  pembimbing: json['pembimbing'] as String?,
  startDate:
      json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
  endDate:
      json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
);

Map<String, dynamic> _$PKLStudentToJson(PKLStudent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nis': instance.nis,
      'kelas': instance.kelas,
      'lokasi': instance.lokasi,
      'pembimbing': instance.pembimbing,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };

PKLProgress _$PKLProgressFromJson(Map<String, dynamic> json) => PKLProgress(
  totalDays: (json['totalDays'] as num).toInt(),
  completedDays: (json['completedDays'] as num).toInt(),
  progressPercentage: (json['progressPercentage'] as num).toDouble(),
  attendanceByMonth: Map<String, int>.from(json['attendanceByMonth'] as Map),
);

Map<String, dynamic> _$PKLProgressToJson(PKLProgress instance) =>
    <String, dynamic>{
      'totalDays': instance.totalDays,
      'completedDays': instance.completedDays,
      'progressPercentage': instance.progressPercentage,
      'attendanceByMonth': instance.attendanceByMonth,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _PKLApiService implements PKLApiService {
  _PKLApiService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<JurnalPKL>> getJurnalList({
    String? search,
    String? status,
    String? startDate,
    String? endDate,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'search': search,
      r'status': status,
      r'start_date': startDate,
      r'end_date': endDate,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<JurnalPKL>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/pkl/jurnal',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<JurnalPKL> _value;
    try {
      _value =
          _result.data!
              .map((dynamic i) => JurnalPKL.fromJson(i as Map<String, dynamic>))
              .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> submitJurnal({
    required String kegiatan,
    required String lokasi,
    required List<int> dokumentasi,
    required String filename,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('kegiatan', kegiatan));
    _data.fields.add(MapEntry('lokasi', lokasi));
    _data.files.add(
      MapEntry(
        'dokumentasi',
        MultipartFile.fromBytes(dokumentasi, filename: null),
      ),
    );
    _data.fields.add(MapEntry('filename', filename));
    final _options = _setStreamType<void>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            '/api/pkl/jurnal',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  @override
  Future<List<PKLLocation>> getLocations() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<PKLLocation>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/pkl/locations',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<PKLLocation> _value;
    try {
      _value =
          _result.data!
              .map(
                (dynamic i) => PKLLocation.fromJson(i as Map<String, dynamic>),
              )
              .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<PKLStudent> getStudentPKL() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<PKLStudent>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/pkl/student',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PKLStudent _value;
    try {
      _value = PKLStudent.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<PKLProgress> getProgress() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<PKLProgress>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/pkl/progress',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late PKLProgress _value;
    try {
      _value = PKLProgress.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<JurnalPKL> getJurnalDetail(int id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<JurnalPKL>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/pkl/jurnal/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late JurnalPKL _value;
    try {
      _value = JurnalPKL.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> updateJurnalStatus(
    int id,
    String status,
    String? catatan,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {'status': status, 'catatan': catatan};
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<void>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/pkl/jurnal/${id}/status',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
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
