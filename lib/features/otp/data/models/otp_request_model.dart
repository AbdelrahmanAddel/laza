import 'package:json_annotation/json_annotation.dart';

part 'otp_request_model.g.dart';

@JsonSerializable()
class OtpRequestModel {
  final String email;
  final String otp;

  const OtpRequestModel({
    required this.email,
    required this.otp,
  });

  factory OtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$OtpRequestModelToJson(this);
}
