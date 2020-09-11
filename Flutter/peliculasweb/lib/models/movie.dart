class Movie {
  int id;
  String title;
  double voteAverage;
  String releaseDate;
  String overview;
  String posterPath;

  Movie(this.id, this.title, this.voteAverage, this.releaseDate, this.overview,
      this.posterPath);

  Movie.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.voteAverage = json['vote_average'] * 1.0;
    this.releaseDate = json['release_date'];
    this.overview = json['overview'];
    this.posterPath = json['posterPath'];
  }
}
