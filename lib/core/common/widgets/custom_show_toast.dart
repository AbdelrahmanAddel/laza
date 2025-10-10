import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> customShowToast(String message, BuildContext context) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 4,
    backgroundColor: Colors.lightGreen,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
