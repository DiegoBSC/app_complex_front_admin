import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messageKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.red.withOpacity(0.8),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ));

    messageKey.currentState!.showSnackBar(snackBar);
  }

  static showSnackbarSuccess(String message) {
    final snackBar = SnackBar(
        backgroundColor: primaryColor.withOpacity(0.8),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ));

    messageKey.currentState!.showSnackBar(snackBar);
  }
}
