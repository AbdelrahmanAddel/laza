import 'package:flutter/cupertino.dart';

class OtpControllers {
  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void dispose() {
    otpController.dispose();
  }
}
