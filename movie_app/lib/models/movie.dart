class Movie {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Movie({this.name, this.images, this.rating, this.totalTime});

  factory Movie.fromJson(dynamic json) {
    return Movie(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }

  static List<Movie> movieFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Movie.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Movie {name: $name, images: $images, rating: $rating, totalTime: $totalTime}';
  }
}
