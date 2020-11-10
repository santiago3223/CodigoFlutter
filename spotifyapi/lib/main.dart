import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  List<Artist> artistas = [];

  String token =
      "Bearer BQD5LHIbxsFMIh-j7M99F5pYC4KBMkPQovt2CYpY4vMRYWvMvTZSe0DoAtlKfcP-B8eilm4SpI6-LPHbnPli0JoP8kCeZz3862PZpQxtfVoQOiNBTM74NPfPQu2bO_8Z-DII-WbpyqistsoqYUa_0Ep_R0wFs14-TE-9W9V1bftqLWtqk6ftc6jVzf3I55KHZRR9plUnt0P_SuH_yUbejf2jeIOHj42quKG9I8jisEoYR4r_LPcyWSq-K13tXEYwlH62xhbxZYEfRgH-";

  void getArtists() async {
    Response response = await Dio().get(
      "https://api.spotify.com/v1/search?q=Muse&type=artist",
      options: Options(
        headers: {
          "Authorization": token,
        },
      ),
    );
    var jsonArtists = response.data["artists"]["items"];
    for (var a in jsonArtists) {
      var artista = Artist.fromJson(a);
      artistas.add(artista);
      print(artista.name);
    }
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
                title: Text(artistas[index].name),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
