import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spotifyapi/artist_detail.dart';
import 'package:spotifyapi/models/artist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SearchArtistView(),
    );
  }
}

class SearchArtistView extends StatefulWidget {
  @override
  _SearchArtistViewState createState() => _SearchArtistViewState();
}

class _SearchArtistViewState extends State<SearchArtistView> {
  TextEditingController searchController = TextEditingController();
  List artistas = [];

  String token =
      "Bearer BQCvmlA9wUakOv7v8WyOEWGhOJFUkpAnzyD8Dk7uYaqzIo9y3oQesokjF5A0y9pvbk8oD9b-d5teDT8B-Hor_dxCwIBaELMXGUyUAhuSusDLhMjI_e9jAocptzuGtA7fSNMXitEPXBu05iAMgRDnsP6h5ehhC6OhNw4gzVFQPjs4gfo2ydPHQjmqak20xYxFXHclc18KdS0IZClGU1_34abEqy49h2En7wP2L4_l3HfdIpegXbDb1XOAOiW-NaHUaA_c-KLJwVdRJeh8";

  void getArtists() async {
    Response response = await Dio().get(
      "https://api.spotify.com/v1/search?q=${searchController.text}&type=artist",
      options: Options(
        headers: {
          "Authorization": token,
        },
      ),
    );
    var jsonArtists = response.data["artists"]["items"];
    artistas = jsonArtists.map((e) => Artist.fromJson(e)).toList();
    setState(() {
      artistas = artistas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SpotofiAPI"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(hintText: "Artista"),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      getArtists();
                    })
              ],
            ),
          ),
          Expanded(
              child: Container(
            child: ListView.builder(
              itemCount: artistas.length,
              itemBuilder: (context, index) => ListTile(
                leading: artistas[index].images.length > 0
                    ? Image.network(artistas[index].images[0].url)
                    : Container(),
                title: Text(artistas[index].name),
                trailing: Text(artistas[index].popularity.toString()),
                subtitle: Text(artistas[index].genres.toString()),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArtistDetail(artistas[index].id),
                      ));
                },
              ),
            ),
          )),
        ],
      ),
    );
  }
}
