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

  static showBusyIndicator(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      backgroundColor: secondaryColor.withOpacity(0.3),
      content: SizedBox(
        width: 100,
        height: 150,
        child: Column(
          children: const [
            Center(
                child: Image(
              image: AssetImage('assets/loader2.gif'),
              height: 50,
              width: 50,
            )),
            Text(
              'Cargando',
              style: TextStyle(color: primaryColor, fontSize: 20),
            )
          ],
        ),
      ),
    );

    showDialog(context: context, builder: (_) => dialog);
  }
}
