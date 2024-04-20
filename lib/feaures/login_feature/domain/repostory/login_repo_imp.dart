import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_task/feaures/login_feature/data/data_source/remote/repostory/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<User?> signUpWithEmailAndPasswordd(
      {required String email, required String password}) async {
    try {
      return await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((UserCredential value) {
        return value.user;
      });
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<User?> signInWithEmailAndPasswordd(
      {required String email, required String password}) async {
    try {
      return await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((UserCredential value) {
        log("ddddddddddddddddddddddddddddddd");
        print('${value.user}');
        return value.user;
      });
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
