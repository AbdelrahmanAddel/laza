import 'package:laza/features/otp/data/models/otp_request_model.dart';
import 'package:laza/features/otp/data/models/resend_otp_request_model.dart';

abstract class OtpRepository {
  Future<String> validateOtp(OtpRequestModel request);
  Future<String> resendOtp(ResendOtpRequestModel request);
}
