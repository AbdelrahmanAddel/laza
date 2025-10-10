
sealed class OtpState {}

final class OtpInitial extends OtpState {}

final class OtpSuccess extends OtpState {
  final String message;

  OtpSuccess({required this.message});
}

final class OtpFailure extends OtpState {
  final String errors;

  OtpFailure({required this.errors});
}

final class LoadingToOtp extends OtpState {}

final class ResendOtpSuccess extends OtpState {
  final String message;

  ResendOtpSuccess({required this.message});
}
