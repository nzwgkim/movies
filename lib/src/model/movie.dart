class Movie {
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  double voteAverage;
  int voteCount;

  Movie(
      {required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.voteCount});
  Movie.fromJson(Map<String, dynamic> json)
      : overview = json['overview'] as String,
        posterPath = json['poster_path'] as String,
        releaseDate = json['release_date'] as String,
        title = json['title'] as String,
        voteAverage = double.parse(json['vote_average'].toString()),
        voteCount = json['vote_count'] as int;

  String get posterUrl => 'http://image.tmdb.org/t/p/w500/${posterPath}';
}
