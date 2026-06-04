import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/movie_service.dart';
import 'package:movies_app/features/movie_details/cubit/movie_details_state.dart';

class MovieDetailsCubit
    extends Cubit<MovieDetailsState> {

  MovieDetailsCubit()
      : super(
    MovieDetailsLoading(),
  );

  final MovieService movieService =
  MovieService();

  Future<void> getMovieDetails(
      int movieId,
      ) async {

    emit(
      MovieDetailsLoading(),
    );

    try {

      final movie =
      await movieService
          .getMovieDetails(
        movieId,
      );

      final suggestionsMovies =
      await movieService
          .getSuggestionsMovies(
        movieId,
      );

      emit(
        MovieDetailsSuccess(
          movie: movie,

          suggestionsMovies:
          suggestionsMovies,
        ),
      );

    } catch (e) {

      emit(
        MovieDetailsError(
          e.toString(),
        ),
      );
    }
  }
}