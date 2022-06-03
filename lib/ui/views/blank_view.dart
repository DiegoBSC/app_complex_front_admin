import 'package:app_web_admin_complex/ui/cards/white_card.dart';
import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:app_web_admin_complex/ui/labels/custom_label.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(physics: const ClampingScrollPhysics(), children: [
      Text(
        'BlankView',
        style: CustomLabels.h1,
      ),
      const SizedBox(
        height: 20,
      ),
      WhiteCard(
        title: 'Estdisticas',
        child: Text(
          'Hola mundo',
          style: TextStyle(color: Colors.white.withOpacity(whiteTextOpacity)),
        ),
      )
    ]);
  }
}
