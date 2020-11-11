// To parse this JSON data, do
//
//     final song = songFromJson(jsonString);

import 'dart:convert';

import 'album.dart';

Song songFromJson(String str) => Song.fromJson(json.decode(str));

String songToJson(Song data) => json.encode(data.toJson());

class Song {
  Song({
    this.album,
    this.artists,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.isPlayable,
    this.name,
    this.popularity,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
  });

  Album album;
  List<Artist> artists;
  int discNumber;
  int durationMs;
  bool explicit;
  ExternalIds externalIds;
  ExternalUrls externalUrls;
  String href;
  String id;
  bool isLocal;
  bool isPlayable;
  String name;
  int popularity;
  String previewUrl;
  int trackNumber;
  String type;
  String uri;

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        artists:
            List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalIds: ExternalIds.fromJson(json["external_ids"]),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        isPlayable: json["is_playable"],
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album": album.toJson(),
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_ids": externalIds.toJson(),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "is_playable": isPlayable,
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
      };
}

class ExternalUrls {
  ExternalUrls({
    this.spotify,
  });

  String spotify;

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify,
      };
}

class ExternalIds {
  ExternalIds({
    this.isrc,
  });

  String isrc;

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds();

  Map<String, dynamic> toJson() => {
        "isrc": isrc,
      };
}
