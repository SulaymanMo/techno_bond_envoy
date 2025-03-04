part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final LoginModel loginModel;
  AuthSuccess(this.loginModel);
}

final class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}
