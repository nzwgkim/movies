import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/src/movie_list.dart';

import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  final MovieRepository _movieRepository = MovieRepository();
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;
  loadMovies() async {
    List<Movie> listMovies = await _movieRepository.loadMovies();
    _movies = listMovies;
    notifyListeners();
  }

  clearMovies() {
    _movies.clear();
  }
}

class MovieRepository {
  var queryParameters = {'api_key': 'be7a5086ca839d1d338f5d6789a92451'};

  Future<List<Movie>> loadMovies() async {
    // https://www.themoviedb.org/ 제공하는 api key
    var uri =
        Uri.https('api.themoviedb.org', '/3/movie/popular', queryParameters);
    var response = await http.get(uri);
    Map<String, dynamic> body = json.decode(response.body);
    if (body['results'] != null) {
      List<dynamic> list = body['results'];
      return list.map<Movie>((item) => Movie.fromJson(item)).toList();
    }
    throw Error();
  }
}
