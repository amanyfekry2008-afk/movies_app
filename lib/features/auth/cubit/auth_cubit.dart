import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/user_model.dart';
import 'auth_state.dart';
import '../auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());

  final AuthRepository authRepository;

  UserModel? user;

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required int avatar,
  }) async {
    emit(AuthLoading());

    try {
      final result = await authRepository.register(
        name: name,
        email: email,
        password: password,
        phone: phone,
        avatar: avatar,
      );

      final uid = result.user!.uid;

      user = UserModel(
        uid: uid,
        name: name,
        email: email,
        phone: phone,
        avatar: avatar,
      );

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      final result = await authRepository.login(
        email: email,
        password: password,
      );

      final uid = result.user!.uid;

      final fetchedUser = await authRepository.getUser(uid);

      if (fetchedUser == null) {
        emit(AuthError("User data not found"));
        return;
      }

      user = fetchedUser;

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(AuthLoading());

    try {
      await authRepository.resetPassword(email: email);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());

    try {
      final result = await authRepository.signInWithGoogle();

      final userData = result.user!;

      await authRepository.updateUser(
        UserModel(
          uid: userData.uid,
          name: userData.displayName ?? "",
          email: userData.email ?? "",
          phone: "",
          avatar: 0,
        ),
      );

      user = await authRepository.getUser(userData.uid);

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> getUser(String uid) async {
    emit(AuthLoading());

    try {
      final fetchedUser = await authRepository.getUser(uid);

      if (fetchedUser == null) {
        emit(AuthError("User not found"));
        return;
      }

      user = fetchedUser;

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> updateProfile(UserModel newUser) async {
    emit(AuthLoading());

    try {
      await authRepository.updateUser(newUser);

      user = newUser;

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    emit(AuthLoading());

    try {
      final uid = user!.uid;

      await authRepository.deleteUser(uid);

      await FirebaseAuth.instance.currentUser!.delete();

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());

    try {
      await authRepository.signOut();

      user = null;

      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}