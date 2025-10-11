import 'package:laza/features/signup/data/models/signup_request_model.dart';
import 'package:laza/features/signup/data/models/signup_response_model.dart';

abstract class SignupRepository {
  Future<SignupResponseModel> signup(SignupRequestModel request);
}
