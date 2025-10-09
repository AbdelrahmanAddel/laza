part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponseModel loginResponse;

  LoginSuccess({required this.loginResponse});
}

final class LoginFailure extends LoginState {
  final String errors;

  LoginFailure({required this.errors});
}

final class LoadingToLogin extends LoginState {}
