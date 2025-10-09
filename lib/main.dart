import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/helper/shared_pref.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/login/presentation/screen/login_screen.dart';
import 'package:laza/features/main/presentation/screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  await SharedPrefHelper.init();
  runApp(LazaApp());
}

class LazaApp extends StatelessWidget {
  const LazaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: FutureBuilder(
        future: _checkLogin(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: snapshot.data ? MainScreen() : LoginScreen(),
          );
        },
      ),
    );
  }

  Future<bool> _checkLogin() async {
    final token = await SharedPrefHelper.getSecuredString('token');
    return token != '';
  }
}
