import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Utils {
  // ignore: constant_identifier_names
  static const String IMG_KEY = 'IMAGE_KAY';

  static const Color buttonColor = Colors.green;
  static void focusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static dayTime(DateTime dateTime) {
    switch (dateTime.hour) {
      case 1:
        return 'Have a smiley Morning';
      case 2:
        return 'Have a Nice Morning ';
      case 3:
        return 'Have a Nice Morning';
      case 4:
        return 'Have a happy day';
      case 5:
        return 'Have a good day';
      case 6:
        return 'Good Morning';
      case 7:
        return 'Good Morning';
      case 8:
        return 'have a lovely day';
      case 9:
        return 'have a Nice day';
      case 11:
        return 'Have a Good day';
      case 12:
        return 'Have a Good lunch time';
      case 17:
        return 'Good evening';
      case 18:
        return 'Good evening';
      case 20:
        return 'Good evening';
      case 19:
        return 'have a happy evening';
      default:
        return 'Have a good Time';
    }
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

  static popupAwesome(BuildContext context, body, onTap) {
    return AwesomeDialog(
      context: context,
      animType: AnimType.bottomSlide,
      dialogType: DialogType.info,
      body: body,
      btnOkOnPress: onTap,
    )..show();
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 20,
          ),
        )));
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

  static slidingUpPanel(BuildContext context, String body, String appbar) {
    return SlidingUpPanel(
      body: const Column(),
    );
  }
}
