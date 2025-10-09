import 'package:flutter/cupertino.dart';

class LoginControllers {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  dispose(){
    emailController.dispose();
    passwordController.dispose();
  }
}
