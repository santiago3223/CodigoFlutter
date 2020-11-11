import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spotifyapi/spotify_api.dart';

import 'models/song.dart';

class AlbumDetail extends StatefulWidget {
  String nombreAlbum;
  String id;

  AlbumDetail(this.id, this.nombreAlbum);
  @override
  _AlbumDetailState createState() => _AlbumDetailState();
}

class _AlbumDetailState extends State<AlbumDetail> {
  List songs = [];

  void getSongs() async {
    Dio dio = SpotifyAPI.createDio();
    Response response = await dio.get("albums/${widget.id}/tracks",
        options: Options(headers: {"requiresToken": true}));
    var jsonArtists = response.data["items"];
    print(response.data["items"]);
    songs = jsonArtists.map((e) => Song.fromJson(e)).toList();
    setState(() {
      songs = songs;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nombreAlbum),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(songs[index].name),
            ),
          )),
        ],
      ),
    );
  }
}
