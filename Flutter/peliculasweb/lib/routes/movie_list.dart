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
  Icon visibleIcon = Icon(Icons.search);
  Widget searchBar = Text('Estrenos');

  @override
  void initState() {
    helper = HttpHelper();
    helper.getUpcoming().then((value) {
      setState(() {
        result = value;
      });
    });
    super.initState();
  }

  Future search(String text) async {
    result = await helper.findMovies(text);
    setState(() {
      result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    String defaultImage =
        'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

    String imageBaseUrl = 'https://image.tmdb.org/t/p/w92/';

    return Scaffold(
      appBar: AppBar(
        title: searchBar,
        actions: [
          IconButton(
            icon: visibleIcon,
            onPressed: () {
              if (visibleIcon.icon == Icons.search) {
                setState(() {
                  visibleIcon = Icon(Icons.cancel);
                  searchBar = TextField(
                    onSubmitted: (text) {
                      search(text);
                    },
                  );
                });
              } else {
                setState(() {
                  visibleIcon = Icon(Icons.search);
                  searchBar = Text("Estrenos");
                });
              }
            },
          )
        ],
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
