import 'package:dartz/dartz.dart';
import 'package:laza/features/signup/data/models/signup_request_model.dart';
import 'package:laza/features/signup/data/models/signup_response_model.dart';

abstract class SignupRepository {
Future<Either<String, SignupResponseModel>> signup(SignupRequestModel request);
}
