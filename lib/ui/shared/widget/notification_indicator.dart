import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:flutter/material.dart';

class NotificationIndicator extends StatelessWidget {
  const NotificationIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(
          Icons.notifications_none_outlined,
          color: primaryColor,
        ),
        Positioned(
          left: 5,
          top: 2,
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(100)),
          ),
        ),
      ],
    );
  }
}
