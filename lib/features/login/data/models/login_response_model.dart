import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'accessToken')
  final String token;
  
  @JsonKey(name: 'expiresAtUtc')
  final String expiresAtUtc;
  
  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  const LoginResponseModel({
    required this.token,
    required this.expiresAtUtc,
    required this.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
