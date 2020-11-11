import 'package:dio/dio.dart';

class SpotifyAPI {
  static Dio createDio() {
    return Dio(
      BaseOptions(
        baseUrl: "https://api.spotify.com/v1/",
        connectTimeout: 5000,
        receiveTimeout: 5000,
      ),
    )..interceptors.add(InterceptorsWrapper(
        onRequest: (options) => requestInterceptor(options),
        onResponse: (e) {
          print(e);
        },
        onError: (e) {
          print(e);
        },
      ));
  }

  static dynamic requestInterceptor(options) {
    // Consultar si el token es valido, sino sacar otro
    // Consultar su token de Sharedprefs
    if (!options.headers.containsKey("requiresToken") ||
        options.headers["requiresToken"]) {
      options.headers.remove("requiresToken");
      String token =
          "Bearer BQDLIQ6GMEYXhMm2sh4iuTUHk1xqHPpxAkY_0kChkmPgHJ75rzLSL8DvOCCJ1JUkB2Q_gW4hHe4Jhuh-0hjdMF8rYi1cCCzCFGuJjsavyGmQhUw38DWQx3i7M398SOluuKbBXlblU84fFVg-2V7Y9iQ7MYLqKqheH3e2-E1F2JVgA_Mp9TvHAyIjmgvts5wmZTPm-UTeaRZJ7Rgxh-cTxk0HgX-bc11DlHSldIGyFXccw4Y3Smvhi5xud_gxaItISofC-aJJs3kOBXZf";
      options.headers.addAll({
        "Authorization": token,
      });
    }
  }
}
