import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  Future<User?> signUpWithEmailAndPasswordd(
      {required String email, required String password});

  Future<User?> signInWithEmailAndPasswordd(
      {required String email, required String password});
}
