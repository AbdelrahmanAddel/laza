import 'package:laza/features/otp/data/models/otp_request_model.dart';

abstract class OtpRepository {
  Future<String> validateOtp(OtpRequestModel request);
}
