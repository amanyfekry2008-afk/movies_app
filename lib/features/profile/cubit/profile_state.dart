import 'package:movies_app/features/movie_details/movie_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {

  final List<MovieModel> historyMovies;

  final List<MovieModel> wishlistMovies;

  ProfileSuccess({
    required this.historyMovies,
    required this.wishlistMovies,
  });
}

class ProfileError extends ProfileState {

  final String errorMessage;

  ProfileError(this.errorMessage);
}