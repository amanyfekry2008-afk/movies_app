import 'package:movies_app/features/movie_details/movie_model.dart';

abstract class BrowseState {}

class BrowseLoading
    extends BrowseState {}

class BrowseSuccess
    extends BrowseState {

  final List<MovieModel> movies;

  final String selectedGenre;

  BrowseSuccess({
    required this.movies,
    required this.selectedGenre,
  });
}

class BrowseError
    extends BrowseState {

  final String errorMessage;

  BrowseError(
      this.errorMessage,
      );
}