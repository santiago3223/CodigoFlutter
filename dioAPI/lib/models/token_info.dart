// To parse this JSON data, do
//
//     final tokenInfo = tokenInfoFromJson(jsonString);

import 'dart:convert';

TokenInfo tokenInfoFromJson(String str) => TokenInfo.fromJson(json.decode(str));

String tokenInfoToJson(TokenInfo data) => json.encode(data.toJson());

class TokenInfo {
  TokenInfo({
    this.token,
    this.userId,
  });

  String token;
  int userId;

  factory TokenInfo.fromJson(Map<String, dynamic> json) => TokenInfo(
        token: json["token"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_id": userId,
      };
}
