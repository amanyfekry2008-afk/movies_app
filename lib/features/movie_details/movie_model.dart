
class MovieModel {

final int id;
final String title;
final int year;
final double rating;
final String image;
final String summary;

final List<String> screenshots;

final List<String> genres;

MovieModel({
required this.id,
required this.title,
required this.year,
required this.rating,
required this.image,
required this.summary,
required this.screenshots,
required this.genres,
});

factory MovieModel.fromJson(
Map<String, dynamic> json,
) {

return MovieModel(
id:
json['id'] ?? 0,

title:
json['title'] ?? '',

year:
json['year'] ?? 0,

rating:
(json['rating'] ?? 0)
    .toDouble(),

image:
json['large_cover_image']
??
json['medium_cover_image']
??
'',

summary:
json['description_full']
??
json['summary']
??
'',

screenshots: [

json['large_screenshot_image1']
?? '',

json['large_screenshot_image2']
?? '',

json['large_screenshot_image3']
?? '',
],

genres:
json['genres'] != null
? List<String>.from(
json['genres'],
)
    : [],
);
}
}

