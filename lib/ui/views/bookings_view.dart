import 'package:app_web_admin_complex/ui/labels/custom_label.dart';
import 'package:flutter/material.dart';

class BookingsView extends StatelessWidget {
  const BookingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(physics: const ClampingScrollPhysics(), children: [
      Text(
        'BookingsView',
        style: CustomLabels.h1,
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}
