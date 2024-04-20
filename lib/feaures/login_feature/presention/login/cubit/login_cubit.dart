import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task/feaures/login_feature/data/data_source/remote/repostory/login_repo.dart';
import 'package:login_task/feaures/login_feature/presention/home/home_screen.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginSignUpLoading());

  LoginRepo? loginRepo;

  Future<User?> signUpCubit(
      {required String email, required String password}) async {
    emit(LoginSignUpLoading());
    log('herrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    var user = await loginRepo!
        .signUpWithEmailAndPasswordd(email: email, password: password);
    if (user == null) {
      emit(LoginSignUpError());
      return null;
    } else {
      emit(LoginSignUpSucses(user));
      return user;
    }
  }

  Future<User?> signInCubit(
      {required String email, required String password}) async {
    emit(LoginSignInLoading());
    var user = await loginRepo!
        .signInWithEmailAndPasswordd(email: email, password: password);
    if (user == null) {
      emit(LoginSignInError());
      return null;
    } else {
      emit(LoginSignInSucses(user));
      return user;
    }
  }

  Future<void> checkLoginAndRegister(
      BuildContext context,
      TextEditingController emailcontroller,
      TextEditingController passwordController,
      bool isLogin) async {
    var email = emailcontroller.text;
    var password = passwordController.text;
    var user;
    if (isLogin) {
      user = '';
      user = await signInCubit(email: email, password: password);
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('You are not registered please create acount first')));
      }
    } else {
      user = '';
      user = await signUpCubit(email: email, password: password);
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The Email is already in use by another acount')));
      }
    }

    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScrenn();
      }));
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('email login sucess ${user.email}')));
    }
    // if (user == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text('You are not registered please create acount first')));
    // }
  }
}
