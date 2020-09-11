import 'package:flutter/material.dart';
import 'package:peliculasweb/routes/movie_detail.dart';
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
    String defaultImage =
        'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

    String imageBaseUrl = 'https://image.tmdb.org/t/p/w92/';

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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetail(result[index])));
                },
                leading: Hero(
                  tag: result[index].posterPath,
                  child: Image.network(result[index].posterPath == null
                      ? defaultImage
                      : imageBaseUrl + result[index].posterPath),
                ),
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
