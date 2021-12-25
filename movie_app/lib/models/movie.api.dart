import 'dart:convert';
import 'package:movie_app/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieApi {
  static Future<List<Movie>> getMovie() async {
    var uri = Uri.https('ott-details.p.rapidapi.com', '/advancedsearch', {
      "start_year": "1970",
      "end_year": "2020",
      "min_imdb": "6",
      "max_imdb": "7.8",
      "genre": "action",
      "language": "english",
      "type": "movie",
      "sort": "latest",
      "page": "1"
    });

    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "ott-details.p.rapidapi.com",
      "x-rapidapi-key": "8333e6f52fmshc8dbde34b2cead8p12efcajsna7a847ff2eba",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Movie.movieFromSnapshot(_temp);
  }
}
