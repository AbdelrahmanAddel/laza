import 'package:flutter/material.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupSuccess extends SignupState {
  final String message;

  SignupSuccess({required this.message});
}

final class SignupFailure extends SignupState {
  final String errors;

  SignupFailure({required this.errors});
}

final class LoadingToSignup extends SignupState {}
