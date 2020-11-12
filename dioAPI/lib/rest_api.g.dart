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
  Future<Cliente> registrarCliente(cliente) async {
    ArgumentError.checkNotNull(cliente, 'cliente');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(cliente?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/cliente/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{r'content-Type': 'application/json'},
            extra: _extra,
            contentType: 'application/json',
            baseUrl: baseUrl),
        data: _data);
    final value = Cliente.fromJson(_result.data);
    return value;
  }

  @override
  Future<TokenInfo> ingresarCliente(username, password) async {
    ArgumentError.checkNotNull(username, 'username');
    ArgumentError.checkNotNull(password, 'password');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'username': username, 'password': password};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/token/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{r'content-Type': 'application/json'},
            extra: _extra,
            contentType: 'application/json',
            baseUrl: baseUrl),
        data: _data);
    final value = TokenInfo.fromJson(_result.data);
    return value;
  }
}
