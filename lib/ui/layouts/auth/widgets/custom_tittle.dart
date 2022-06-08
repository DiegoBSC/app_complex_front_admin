import 'package:flutter/material.dart';

class CustomTittle extends StatelessWidget {
  const CustomTittle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 10,
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Image.asset(
            'assets/balon-green.png',
            width: 150,
            height: 150,
          ),
        )
      ]),
    );
  }
}
