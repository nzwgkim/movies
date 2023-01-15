import 'package:flutter/material.dart';
import 'package:movies/src/movie_provider.dart';
import 'package:provider/provider.dart';

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

  String get posterUrl => 'http://image.tmdb.org/t/p/w500/$posterPath';
}

class MovieListWidget extends StatelessWidget {
  MovieListWidget({super.key});
  // MovieListWidget({Key? key}) : super(key: key);
  late MovieProvider _movieProvider;

  Widget _makeListView(List<Movie> movies) {
    return ListView.separated(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        print(movies[index].title);
        return Center(
          child: Text(movies[index].title),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 1);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _movieProvider = Provider.of<MovieProvider>(context);
    _movieProvider.loadMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Provider'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, widget) {
          if (provider.movies.isNotEmpty) {
            return _makeListView(provider.movies);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late MovieProvider _movieProvider;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _movieProvider = Provider.of<MovieProvider>(context);
    _movieProvider.loadMovies();
  }

  @override
  void dispose() {
    _movieProvider.clearMovies();
    super.dispose();
  }

  Widget _makeMovieOne(Movie movie) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.network(movie.posterUrl)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    child: Text(
                      movie.overview,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13),
                      maxLines: 8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _makeListView(List<Movie> movies) {
    return ListView.separated(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: _makeMovieOne(movies[index]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 1);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List with Provider"),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, value, child) {
          if (value.movies.isNotEmpty) {
            return _makeListView(value.movies);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
