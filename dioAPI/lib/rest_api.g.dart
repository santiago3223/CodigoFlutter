// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CodigoApi implements CodigoApi {
  _CodigoApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://appcolibri.com/API';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<String>> listarEmpresas(usuario) async {
    ArgumentError.checkNotNull(usuario, 'usuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/empresas/$usuario/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data.cast<String>();
    return value;
  }
}
