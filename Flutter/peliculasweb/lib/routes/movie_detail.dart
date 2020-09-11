import 'package:flutter/material.dart';
import 'package:peliculasweb/models/movie.dart';

class MovieDetail extends StatelessWidget {
  Movie movie;

  String imageBaseUrl = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Hero(
                tag: movie.posterPath,
                child: Image.network(
                  imageBaseUrl + movie.posterPath,
                  height: 500,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(movie.overview)
            ],
          ),
        ),
      ),
    );
  }
}
