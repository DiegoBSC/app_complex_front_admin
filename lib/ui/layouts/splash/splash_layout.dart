import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:flutter/material.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgColor.withOpacity(0.8),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(
                  color: primaryColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Checking ...',
                  style: TextStyle(color: primaryColor, fontSize: 40),
                )
              ]),
        ),
      ),
    );
  }
}
