import 'package:flutter/material.dart';
import 'package:laza/core/helper/shared_pref.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/laza_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  await SharedPrefHelper.init();
  runApp(LazaApp());
}
