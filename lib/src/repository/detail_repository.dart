class DetailRepository {
  void detailMovie() async {
    // https://api.themoviedb.org/3/movie/76600?api_key=be7a5086ca839d1d338f5d6789a92451
    var query = {
      'api_key': 'be7a5086ca839d1d338f5d6789a92451'
    }; // https://www.themoviedb.org/ 제공하는 api key
    var path = '/3/movie/';
    var movieId = '76600';
    var moviePath = path + movieId;
    var authority = 'api.themoviedb.org';
    var uri = Uri.https(authority, moviePath, query);
  }
}
