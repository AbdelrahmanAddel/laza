import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/di/dependency_injection.dart';
import 'package:laza/features/add_review/presentation/screens/add_review_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setup();
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:   AddReviewScreen(productId: '', userId: '',)
        ),
    );
  }
}
