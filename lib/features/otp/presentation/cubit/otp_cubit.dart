import 'package:bloc/bloc.dart';
import 'package:laza/core/errors/server_exception.dart';
import 'package:laza/features/otp/data/models/otp_request_model.dart';
import 'package:laza/features/otp/domain/repositories/otp_repository.dart';
import 'package:laza/features/otp/presentation/cubit/otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepository _otpRepository;

  OtpCubit(this._otpRepository) : super(OtpInitial());

  Future<void> validateOtp(OtpRequestModel otpModel) async {
    emit(LoadingToOtp());
    try {
      final response = await _otpRepository.validateOtp(otpModel);
      emit(OtpSuccess(message: response));
    } on ServerException catch (error) {
      emit(OtpFailure(errors: error.errorModel.getReadableMessage()));
    }
  }
}
