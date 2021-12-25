class Movie {
  final String title;
  final String thumbnailUrl;
  final String release;
  final double rating;

  Movie({this.title, this.thumbnailUrl, this.release, this.rating});

  factory Movie.fromJson(dynamic json) {
    return Movie(
        title: json['results']['title'] as String,
        thumbnailUrl: json['results']['imageurl'][0] as String,
        release: json['results']['released'] as String,
        rating: json['results']['imdbrating'] as double);
  }

  static List<Movie> movieFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Movie.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Movie {title: $title, images: $thumbnailUrl, release: $release, rating: $rating}';
  }
}
