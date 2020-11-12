import 'package:dioAPI/models/token_info.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import 'models/cliente.dart';
import 'models/empresa.dart';

part 'rest_api.g.dart';

@RestApi(baseUrl: "http://appcolibri.com/API")
abstract class CodigoApi {
  factory CodigoApi(Dio dio, {String baseUrl}) = _CodigoApi;

  @POST("/cliente/")
  @Headers(<String, String>{"content-Type": "application/json"})
  Future<Cliente> registrarCliente(
    @Body() Cliente cliente,
  );

  @POST("/token/")
  @Headers(<String, String>{"content-Type": "application/json"})
  Future<TokenInfo> ingresarCliente(
      @Field() String username, @Field() String password);

  @GET("/empresas/{usuario}/")
  @Headers(<String, String>{"content-Type": "application/json"})
  Future<List<Empresa>> listarEmpresas(
    @Path("usuario") String usuario,
  );
}
