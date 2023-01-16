import 'package:flutter/material.dart';
import 'package:movies/src/provider/movie_provider.dart';
import 'package:provider/provider.dart';

import 'package:movies/src/model/movie.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late MovieProvider _movieProvider;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
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
        title: const Text("Popular movies"),
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
