import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/models/user_model.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserCredential> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required int avatar,
  }) async {
    final userCredential =
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = userCredential.user!.uid;

    await firestore.collection('users').doc(uid).set({
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'createdAt': Timestamp.now(),
    });

    return userCredential;
  }

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<UserCredential> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn(scopes: ['email']);

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      throw Exception("Google sign-in cancelled");
    }

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final result =
    await firebaseAuth.signInWithCredential(credential);

    final user = result.user!;

    await firestore.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'name': user.displayName ?? "",
      'email': user.email ?? "",
      'phone': "",
      'avatar': 0,
      'createdAt': Timestamp.now(),
    }, SetOptions(merge: true));

    return result;
  }

  Future<UserModel?> getUser(String uid) async {
    final doc = await firestore.collection('users').doc(uid).get();

    if (!doc.exists || doc.data() == null) {
      return null;
    }

    return UserModel.fromMap(doc.data()!);
  }

  Future<void> updateUser(UserModel user) async {
    await firestore.collection('users').doc(user.uid).set(
      user.toMap(),
      SetOptions(merge: true),
    );
  }

  Future<void> deleteUser(String uid) async {
    await firestore.collection('users').doc(uid).delete();
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

}