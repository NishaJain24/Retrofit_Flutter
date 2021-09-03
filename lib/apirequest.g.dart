// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apirequest.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiRequest implements ApiRequest {
  _ApiRequest(this._dio, {required this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl = 'https://gorest.co.in/public-api/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getUsers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};

     var options=Options(
        receiveTimeout: 1000,sendTimeout: 1000,
        method: 'GET',
        headers: <String, dynamic>{},
        extra: _extra,

      );
    final _result = await _dio.request('$baseUrl/users',
        queryParameters: queryParameters,
        options: options,

        data: _data);
    final value = ResponseData.fromJson(_result.data);
    return value;
  }
}
