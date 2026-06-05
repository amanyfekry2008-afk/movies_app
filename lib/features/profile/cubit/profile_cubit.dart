import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';
import 'package:movies_app/features/profile/cubit/profile_state.dart';
import 'package:movies_app/features/profile/profile_repository.dart';

class ProfileCubit extends Cubit<ProfileState> {

  ProfileCubit()
      : super(ProfileInitial());

  final ProfileRepository repository =
  ProfileRepository();

  List<MovieModel> historyMovies = [];

  List<MovieModel> wishlistMovies = [];

  Future<void> getProfileData() async {

    emit(ProfileLoading());

    try {

      historyMovies =
      await repository.getMovies(
        'history',
      );

      wishlistMovies =
      await repository.getMovies(
        'wishlist',
      );

      emit(
        ProfileSuccess(
          historyMovies: historyMovies,
          wishlistMovies: wishlistMovies,
        ),
      );

    } catch (e) {

      emit(
        ProfileError(
          e.toString(),
        ),
      );
    }
  }

  Future<void> addToHistory(
      MovieModel movie,
      ) async {

    await repository.addMovie(
      movie: movie,
      collectionName: 'history',
    );

    await getProfileData();
  }

  Future<void> addToWishlist(
      MovieModel movie,
      ) async {

    await repository.addMovie(
      movie: movie,
      collectionName: 'wishlist',
    );

    await getProfileData();
  }
}