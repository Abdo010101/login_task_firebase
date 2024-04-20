part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSignUpLoading extends LoginState {}

class LoginSignUpSucses extends LoginState {
  final User user;
  LoginSignUpSucses(this.user);
}

class LoginSignUpError extends LoginState {}

class LoginSignInLoading extends LoginState {}

class LoginSignInSucses extends LoginState {
  final User user;
  LoginSignInSucses(this.user);
}

class LoginSignInError extends LoginState {}
