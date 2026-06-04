import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/movie_service.dart';
import 'package:movies_app/features/search/cubit/search_state.dart';

class SearchCubit
    extends Cubit<SearchState> {

  SearchCubit()
      : super(
    SearchInitial(),
  ) {

    getTrendingMovies();
  }

  final MovieService movieService =
  MovieService();

  Future<void> getTrendingMovies()
  async {

    emit(
      SearchLoading(),
    );

    try {

      final movies =
      await movieService
          .getTrendingMovies();

      emit(
        SearchSuccess(
          movies,
        ),
      );

    } catch (e) {

      emit(
        SearchError(
          e.toString(),
        ),
      );
    }
  }

  Future<void> searchMovies(
      String movieName,
      ) async {

    if (movieName.isEmpty) {

      getTrendingMovies();

      return;
    }

    emit(
      SearchLoading(),
    );

    try {

      final movies =
      await movieService
          .searchMovies(
        movieName,
      );

      emit(
        SearchSuccess(
          movies,
        ),
      );

    } catch (e) {

      emit(
        SearchError(
          e.toString(),
        ),
      );
    }
  }
}