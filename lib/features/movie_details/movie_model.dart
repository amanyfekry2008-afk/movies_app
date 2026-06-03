class MovieModel {
  final String id;
  final String title;
  final String posterImage;
  final String year;
  final String genre;
  final String summary;
  final String ageRating;
  final String duration;
  final double rating;
  final List<String> screenshots;
  final List<String> similarMoviesID;

  MovieModel({
    required this.id,
    required this.title,
    required this.posterImage,
    required this.year,
    required this.genre,
    required this.summary,
    required this.ageRating,
    required this.duration,
    required this.rating,
    this.screenshots = const [],
    this.similarMoviesID = const [],
  });
}
