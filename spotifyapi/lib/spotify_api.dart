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
          //  print("onResponse" + e.toString());
        },
        onError: (e) {
          print("onError" + e.toString());
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
          "Bearer BQDvnmXKaOL8gVGfRnlGJZLN6Xyu5sc1-IC3WJe5L2K0D71KMQN3kJmI_RLyB1AEsiCU2ehI0NukOYI1TYeplMzfFwbMnCu4upUpS2-FLARAfDV8NgsBEOqhyg3z0Q65yCdgqoqNWZatf6WO46_zNcLFJ5kHAvOEpAJkYP9SkfCesZ3uCCSa2JELDlLO7moQLCtbsDtk0j9996qawYcZgbP5sYAZ52Tj9k1DzyATl7i8E4paOCM4SUTIPuwDyWrA8Xhx581SIwDMlAJg";
      options.headers.addAll({
        "Authorization": token,
      });
    }
  }
}
