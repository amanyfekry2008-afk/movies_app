import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/features/movie_details/movie_model.dart';

class ProfileRepository {

  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  final FirebaseAuth auth =
      FirebaseAuth.instance;

  Future<void> addMovie({
    required MovieModel movie,
    required String collectionName,
  }) async {

    final user = auth.currentUser;

    if (user == null) return;

    await firestore
        .collection('users')
        .doc(user.uid)
        .collection(collectionName)
        .doc(movie.id.toString())
        .set({
      'id': movie.id,
      'title': movie.title,
      'year': movie.year,
      'rating': movie.rating,
      'medium_cover_image': movie.image,
      'description_full': movie.summary,
      'runtime': movie.runtime,
      'genres': movie.genres,
      'large_screenshot_image1':
      movie.screenshots.isNotEmpty
          ? movie.screenshots[0]
          : '',

      'large_screenshot_image2':
      movie.screenshots.length > 1
          ? movie.screenshots[1]
          : '',

      'large_screenshot_image3':
      movie.screenshots.length > 2
          ? movie.screenshots[2]
          : '',
    });
  }

  Future<List<MovieModel>> getMovies(
      String collectionName,
      ) async {

    final user = auth.currentUser;

    if (user == null) {
      return [];
    }

    final snapshot = await firestore
        .collection('users')
        .doc(user.uid)
        .collection(collectionName)
        .get();

    return snapshot.docs.map((doc) {

      return MovieModel.fromJson(
        doc.data(),
      );

    }).toList();
  }
}