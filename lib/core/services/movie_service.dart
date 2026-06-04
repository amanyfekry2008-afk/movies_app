import 'package:dio/dio.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';

class MovieService {
  final Dio dio = Dio();
  Future<List<MovieModel>> getTrendingMovies() async {
    Response response = await dio.get(
      'https://movies-api.accel.li/api/v2/list_movies.json?sort_by=download_count&order_by=desc',
    );
    List moviesJson = response.data['data']['movies'] ?? [];
    List<MovieModel> moviesList = moviesJson.map((movie) {
      return MovieModel.fromJson(movie);
    }).toList();
    return moviesList;
  }

  Future<List<MovieModel>> getMoviesByGenre(String genre) async {
    Response response = await dio.get(
      'https://movies-api.accel.li/api/v2/list_movies.json?genre=$genre',
    );
    List moviesJson = response.data['data']['movies'] ?? [];
    List<MovieModel> moviesList = moviesJson.map((movie) {
      return MovieModel.fromJson(movie);
    }).toList();
    moviesList.sort((a, b) {
      if (a.year != b.year) {
        return b.year.compareTo(a.year);
      }
      return b.rating.compareTo(a.rating);
    });
    return moviesList;
  }

  Future<MovieModel> getMovieDetails(int movieId) async {
    Response response = await dio.get(
      'https://movies-api.accel.li/api/v2/movie_details.json?movie_id=$movieId&with_images=true&with_cast=true',
    );
    final movieJson = response.data['data']['movie'];
    return MovieModel.fromJson(movieJson);
  }

  Future<List<MovieModel>> getSuggestionsMovies(int movieId) async {
    Response response = await dio.get(
      'https://movies-api.accel.li/api/v2/movie_suggestions.json?movie_id=$movieId',
    );
    List moviesJson = response.data['data']['movies'] ?? [];
    List<MovieModel> moviesList = moviesJson.map((movie) {
      return MovieModel.fromJson(movie);
    }).toList();
    return moviesList;
  }

  Future<List<MovieModel>> searchMovies(String movieName) async {
    Response response = await dio.get(
      'https://movies-api.accel.li/api/v2/list_movies.json?query_term=$movieName',
    );
    List moviesJson = response.data['data']['movies'] ?? [];
    List<MovieModel> moviesList = moviesJson.map((movie) {
      return MovieModel.fromJson(movie);
    }).toList();
    return moviesList;
  }
}
