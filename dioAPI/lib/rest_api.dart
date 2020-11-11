import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import 'models/cliente.dart';

part 'rest_api.g.dart';

@RestApi(baseUrl: "http://appcolibri.com/API")
abstract class CodigoApi {
  factory CodigoApi(Dio dio, {String baseUrl}) = _CodigoApi;

  @POST("/cliente/")
  @Headers(<String, String>{"content-Type": "application/json"})
  Future<Cliente> registrarCliente(
    @Body() Cliente cliente,
  );
}
