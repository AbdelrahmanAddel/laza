import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:laza/core/errors/server_exception.dart';
import 'package:laza/features/login/data/models/login_request_model.dart';
import 'package:laza/features/login/data/models/login_response_model.dart';
import 'package:laza/features/login/domain/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._login) : super(LoginInitial());
  final LoginRepository _login;

  Future<void> login(LoginRequestModel loginModel) async {
    emit(LoadingToLogin());
    try {
      final response = await _login.login(loginModel);
      emit(LoginSuccess(loginResponse: response));
    } on ServerException catch (error) {
      emit(LoginFailure(errors: error.errorModel.getReadableMessage()));
    }
  }
}
