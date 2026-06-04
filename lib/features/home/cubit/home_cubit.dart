import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/movie_service.dart';
import 'package:movies_app/features/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());

  final MovieService movieService = MovieService();

  Future<void> getMovies() async {
    emit(HomeLoading());

    try {
      final bannerMovies = await movieService.getTrendingMovies();

      final actionMovies = await movieService.getMoviesByGenre('Action');

      final dramaMovies = await movieService.getMoviesByGenre('Drama');

      final comedyMovies = await movieService.getMoviesByGenre('Comedy');

      final sciFiMovies = await movieService.getMoviesByGenre('Sci-Fi');

      emit(
        HomeSuccess(
          bannerMovies: bannerMovies,

          actionMovies: actionMovies,

          dramaMovies: dramaMovies,

          comedyMovies: comedyMovies,

          sciFiMovies: sciFiMovies,
        ),
      );
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
