import 'package:flutter/material.dart';
import 'package:peliculasweb/util/http_helper.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List result;
  HttpHelper helper;

  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    helper.getUpcoming().then((value) {
      setState(() {
        result = value;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Proximas Peliculas"),
      ),
      body: ListView.builder(
          itemCount: (result == null) ? 0 : result.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(result[index].title),
                subtitle: Text("Estrena: " +
                    result[index].releaseDate.toString() +
                    " - Puntaje: " +
                    result[index].voteAverage.toString()),
              ),
            );
          }),
    );
  }
}
