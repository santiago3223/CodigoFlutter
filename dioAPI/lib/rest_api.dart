import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_api.g.dart';

@RestApi(baseUrl: "http://appcolibri.com/API")
abstract class CodigoApi {
  factory CodigoApi(Dio dio, {String baseUrl}) = _CodigoApi;

  @GET("/empresas/{usuario}/")
  Future<List<String>> listarEmpresas(
    @Path("usuario") String usuario,
  );
}
