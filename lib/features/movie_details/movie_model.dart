class MovieModel {

  final int id;
  final String title;
  final int year;
  final double rating;
  final String image;

  MovieModel({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.image,
  });

  factory MovieModel.fromJson(
      Map<String, dynamic> json,
      ) {

    return MovieModel(
      id: json['id'] ?? 0,

      title: json['title'] ?? '',

      year: json['year'] ?? 0,

      rating:
      (json['rating'] ?? 0)
          .toDouble(),

      image:
      json['medium_cover_image'] ?? '',
    );
  }
}