import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:app_web_admin_complex/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: buildBoxDecoration(),
      child: TextField(
        style: TextStyle(color: Colors.white.withOpacity(whiteTextOpacity)),
        decoration: CustomInputs.searchInputDecoration(
            hint: 'Buscar', icon: Icons.search_outlined),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() =>
      BoxDecoration(borderRadius: BorderRadius.circular(10), color: bgColor);
}
