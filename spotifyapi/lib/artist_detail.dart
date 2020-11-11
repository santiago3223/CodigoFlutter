import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spotifyapi/album_detail.dart';
import 'package:spotifyapi/models/album.dart';
import 'package:spotifyapi/spotify_api.dart';

import 'models/song.dart';

class ArtistDetail extends StatefulWidget {
  String id;

  ArtistDetail(this.id);
  @override
  _ArtistDetailState createState() => _ArtistDetailState();
}

class _ArtistDetailState extends State<ArtistDetail> {
  List albums = [];
  List songs = [];

  void getAlbums() async {
    Dio dio = SpotifyAPI.createDio();
    Response response = await dio.get(
      "artists/${widget.id}/albums",
    );
    var jsonArtists = response.data["items"];
    albums = jsonArtists.map((e) => Album.fromJson(e)).toList();
    setState(() {
      albums = albums;
    });
  }

  void getSongs() async {
    Dio dio = SpotifyAPI.createDio();
    Response response = await dio.get(
        "artists/${widget.id}/top-tracks?market=PE",
        options: Options(headers: {"requiresToken": true}));
    var jsonArtists = response.data["tracks"];
    print(response.data["tracks"]);
    songs = jsonArtists.map((e) => Song.fromJson(e)).toList();
    setState(() {
      songs = songs;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAlbums();
    getSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle"),
      ),
      body: Column(
        children: [
          //Galleria de fotos
          Text("Discos"),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: albums.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Card(
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AlbumDetail(albums[index].id, albums[index].name),
                      )),
                  child: Container(
                    child: Column(
                      children: [
                        Image.network(
                          albums[index].images[0].url,
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          albums[index].name,
                        ),
                        Text(
                          albums[index].releaseDate,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text("Exitos"),
          Expanded(
              child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(songs[index].name),
            ),
          ))
        ],
      ),
    );
  }
}
