import 'dart:convert';

// import 'package:flutter_provider_sample/src/model/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movies/src/model/movie.dart';

class MovieRepository {
  Future<List<Movie>> loadMovies() async {
    // https://api.themoviedb.org/3/movie/popular?api_key=be7a5086ca839d1d338f5d6789a92451

    // 방법1
    var query = {
      'api_key': 'be7a5086ca839d1d338f5d6789a92451'
    }; // https://www.themoviedb.org/ 제공하는 api key
    var path = '/3/movie/popular';
    var authority = 'api.themoviedb.org';
    var uri = Uri.https(authority, path, query);

    // 방법2
    // const String baseUrl = 'https://api.themoviedb.org';
    // var popularMovie = '/3/movie/popular';
    // var apiKey = 'api_key=be7a5086ca839d1d338f5d6789a92451';

    // var uri = Uri.parse('$baseUrl/$popularMovie?$apiKey');
    print('URI $uri');

    var response = await http.get(uri);
    Map<String, dynamic> body = json.decode(response.body);
    // if (body['results'] != null) {
    if (response.statusCode == 200) {
      List<dynamic> list = body['results'];
      return list.map<Movie>((item) => Movie.fromJson(item)).toList();
    } else {
      throw Error();
    }
  }
}
