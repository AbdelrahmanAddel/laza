import 'package:flutter/material.dart';

class Navigation {
  static push(Widget screen, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) => screen));
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
