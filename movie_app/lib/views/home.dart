import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.api.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/views/widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> _movie;
  bool _isloading = true;

  @override
  void initState() {
    super.initState();

    getMovie();
  }

  Future<void> getMovie() async {
    _movie = await MovieApi.getMovie();
    setState(() {
      _isloading = false;
    });
    print(_movie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.movie),
              SizedBox(width: 10),
              Text('Movie List')
            ],
          ),
        ),
        body: _isloading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _movie.length,
                itemBuilder: (context, index) {
                  return MovieCard(
                      title: _movie[index].title,
                      rating: _movie[index].rating.toString(),
                      thumbnailUrl: _movie[index].thumbnailUrl,
                      released: _movie[index].release);
                }));
  }
}
