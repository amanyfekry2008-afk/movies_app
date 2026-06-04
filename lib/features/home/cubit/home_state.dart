import 'package:movies_app/features/movie_details/movie_model.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<MovieModel> bannerMovies;

  final List<MovieModel> actionMovies;

  final List<MovieModel> dramaMovies;

  final List<MovieModel> comedyMovies;

  final List<MovieModel> sciFiMovies;

  HomeSuccess({
    required this.bannerMovies,
    required this.actionMovies,
    required this.dramaMovies,
    required this.comedyMovies,
    required this.sciFiMovies,
  });
}

class HomeError extends HomeState {
  final String errorMessage;

  HomeError(this.errorMessage);
}
