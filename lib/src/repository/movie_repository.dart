import 'dart:convert';

// import 'package:flutter_provider_sample/src/model/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movies/src/model/movie.dart';

class MovieRepository {
  Future<List<Movie>> loadMovies() async {
    var queryParameters = {
      'api_key': 'be7a5086ca839d1d338f5d6789a92451'
    }; // https://www.themoviedb.org/ 제공하는 api key
    var uri =
        Uri.https('api.themoviedb.org', '/3/movie/popular', queryParameters);
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
