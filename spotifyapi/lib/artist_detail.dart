import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spotifyapi/models/album.dart';

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
  String token =
      "Bearer BQCvmlA9wUakOv7v8WyOEWGhOJFUkpAnzyD8Dk7uYaqzIo9y3oQesokjF5A0y9pvbk8oD9b-d5teDT8B-Hor_dxCwIBaELMXGUyUAhuSusDLhMjI_e9jAocptzuGtA7fSNMXitEPXBu05iAMgRDnsP6h5ehhC6OhNw4gzVFQPjs4gfo2ydPHQjmqak20xYxFXHclc18KdS0IZClGU1_34abEqy49h2En7wP2L4_l3HfdIpegXbDb1XOAOiW-NaHUaA_c-KLJwVdRJeh8";

  void getAlbums() async {
    Response response = await Dio().get(
      "https://api.spotify.com/v1/artists/${widget.id}/albums",
      options: Options(
        headers: {
          "Authorization": token,
        },
      ),
    );
    var jsonArtists = response.data["items"];
    albums = jsonArtists.map((e) => Album.fromJson(e)).toList();
    setState(() {
      albums = albums;
    });
  }

  void getSongs() async {
    Response response = await Dio().get(
      "https://api.spotify.com/v1/artists/${widget.id}/top-tracks?market=PE",
      options: Options(
        headers: {
          "Authorization": token,
        },
      ),
    );
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
