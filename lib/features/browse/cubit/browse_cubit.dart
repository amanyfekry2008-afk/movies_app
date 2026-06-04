import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/movie_service.dart';
import 'package:movies_app/features/browse/cubit/browse_state.dart';

class BrowseCubit extends Cubit<BrowseState> {
  BrowseCubit() : super(BrowseLoading());

  final MovieService movieService = MovieService();

  final List<String> genres = ['Action', 'Drama', 'Comedy', 'Sci-Fi', 'Horror'];

  Future<void> getMoviesByGenre(String genre) async {
    emit(BrowseLoading());

    try {
      final movies = await movieService.getMoviesByGenre(genre);

      emit(BrowseSuccess(movies: movies, selectedGenre: genre));
    } catch (e) {
      emit(BrowseError(e.toString()));
    }
  }
}
