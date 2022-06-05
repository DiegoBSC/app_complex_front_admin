import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData icon;

  const CustomIconButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.color,
      this.isFilled = false,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
          shape: MaterialStateProperty.all(const StadiumBorder()),
          backgroundColor: MaterialStateProperty.all(color),
          overlayColor: MaterialStateProperty.all(color.withOpacity(0.3)),
        ),
        onPressed: () => onPressed(),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white.withOpacity(whiteTextOpacity),
            ),
            Text(
              text,
              style:
                  TextStyle(color: Colors.white.withOpacity(whiteTextOpacity)),
            )
          ],
        ));
  }
}
