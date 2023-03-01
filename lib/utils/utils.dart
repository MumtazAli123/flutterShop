
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static const Color buttonColor = Colors.green;
  static void focusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          flushbarStyle: FlushbarStyle.FLOATING,
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(21),
          message: message,
          borderRadius: BorderRadius.circular(10),
          duration: const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 30,
            color: Colors.white,
          ),
        )..show(context));
  }


  static snackBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(backgroundColor: Colors.green,
            content: Text(message, style: const TextStyle(fontSize: 20, ),))
    );
  }

  static snackBar1(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            message,
            style: const TextStyle(fontSize: 24),
          )),
    );
  }
}