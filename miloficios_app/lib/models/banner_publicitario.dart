// To parse this JSON data, do
//
//     final bannerPublicitario = bannerPublicitarioFromJson(jsonString);

import 'dart:convert';

BannerPublicitario bannerPublicitarioFromJson(String str) =>
    BannerPublicitario.fromJson(json.decode(str));

String bannerPublicitarioToJson(BannerPublicitario data) =>
    json.encode(data.toJson());

class BannerPublicitario {
  BannerPublicitario({
    this.urlBanner,
  });

  String urlBanner;

  factory BannerPublicitario.fromJson(Map<String, dynamic> json) =>
      BannerPublicitario(
        urlBanner: json["urlBanner"],
      );

  Map<String, dynamic> toJson() => {
        "urlBanner": urlBanner,
      };
}
