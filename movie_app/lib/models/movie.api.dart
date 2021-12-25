import 'dart:convert';
import 'package:movie_app/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieApi {
  static Future<List<Movie>> getMovie() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "x-rapidapi-key": "8333e6f52fmshc8dbde34b2cead8p12efcajsna7a847ff2eba",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Movie.movieFromSnapshot(_temp);
  }
}
