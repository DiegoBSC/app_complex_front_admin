import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData? icon;
  final Color? colorIcon;

  const CustomOutlinedButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.icon,
      this.color = primaryColor,
      this.isFilled = false,
      this.colorIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
            side: MaterialStateProperty.all(BorderSide(color: color)),
            backgroundColor: MaterialStateProperty.all(
                isFilled ? color.withOpacity(0.30) : Colors.transparent)),
        onPressed: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: icon == null
              ? Text(
                  text,
                  style: const TextStyle(fontSize: 16, color: primaryColor),
                )
              : ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 100),
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        color: colorIcon != null ? colorIcon : null,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        text,
                        style:
                            const TextStyle(fontSize: 16, color: primaryColor),
                      )
                    ],
                  ),
                ),
        ));
  }
}
