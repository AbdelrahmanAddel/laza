import 'package:bloc/bloc.dart';
import 'package:laza/core/errors/exceptions.dart';
import 'package:laza/features/signup/data/models/signup_request_model.dart';
import 'package:laza/features/signup/domain/repositories/signup_repository.dart';
import 'package:laza/features/signup/presentation/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepository _signupRepository;

  SignupCubit(this._signupRepository) : super(SignupInitial());

  Future<void> signup(SignupRequestModel signupModel) async {
    emit(LoadingToSignup());
    try {
      final response = await _signupRepository.signup(signupModel);
      emit(SignupSuccess(message: response.message ?? ''));
    } on ServerException catch (e) {
      emit(SignupFailure(errors: e.message));
    }
  }
}
