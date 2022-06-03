import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteCard extends StatelessWidget {
  final String? title;
  final double? width;
  final Widget child;
  const WhiteCard({Key? key, this.title, required this.child, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                title!,
                style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(whiteTextOpacity)),
              ),
            ),
            Divider(color: primaryColor.withOpacity(0.2)),
          ],
          child
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: primaryColor.withOpacity(0.3), blurRadius: 5)
          ]);
}
