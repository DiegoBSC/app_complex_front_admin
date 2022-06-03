import 'package:app_web_admin_complex/providers/auth_provider.dart';
import 'package:app_web_admin_complex/ui/cards/white_card.dart';
import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:app_web_admin_complex/ui/labels/custom_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeUser = Provider.of<AuthProvider>(context).user;

    return ListView(physics: const ClampingScrollPhysics(), children: [
      Text(
        'Dashboard',
        style: CustomLabels.h1,
      ),
      const SizedBox(
        height: 20,
      ),
      WhiteCard(
        title: activeUser!.username,
        child: Text(
          activeUser.email,
          style: TextStyle(color: Colors.white.withOpacity(whiteTextOpacity)),
        ),
      )
    ]);
  }
}
