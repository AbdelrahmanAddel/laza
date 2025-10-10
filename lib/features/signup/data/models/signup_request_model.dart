import 'package:json_annotation/json_annotation.dart';

part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const SignupRequestModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  factory SignupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestModelToJson(this);
}
