import 'package:movies_app/features/movie_details/movie_model.dart';

abstract class MovieDetailsState {}

class MovieDetailsLoading
    extends MovieDetailsState {}

class MovieDetailsSuccess
    extends MovieDetailsState {

  final MovieModel movie;

  final List<MovieModel>
  suggestionsMovies;

  MovieDetailsSuccess({
    required this.movie,
    required this.suggestionsMovies,
  });
}

class MovieDetailsError
    extends MovieDetailsState {

  final String errorMessage;

  MovieDetailsError(
      this.errorMessage,
      );
}