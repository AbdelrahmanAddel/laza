import 'package:flutter/material.dart';
import 'package:laza/core/helper/shared_pref.dart';
import 'package:laza/features/cart/presentation/screens/cart_screen.dart';
import 'package:laza/features/home/presentation/screen/home_screen.dart';
import 'package:laza/features/main/presentation/widgets/custom_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    SharedPrefHelper.setSecuredString('token',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNjliZDhhYS1jMWE5LTRjODItNTM3NC0wOGRlMDQ4NTRkODkiLCJqdGkiOiJhYTZiZmFhMi02ZmMwLTQ3YjUtYWQxNS0wNmVkMDgyZjU5Y2UiLCJlbWFpbCI6InNhZGlvem1hbm5AZ21haWwuY29tIiwibmFtZSI6IkFiZGVscmFtYW4gQWRlbCBFenplbGRlYW4iLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3NjAwNDE3MDksImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.ILGhXkaFB17meH1HKXB5t8ulZT4nQoa4qPdeShfpooE');
    super.initState();
  }

  int currentIndex = 0;

  final screens = [
    HomeScreen(),
    const Placeholder(),
    const CartScreen(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
