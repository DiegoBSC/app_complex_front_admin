import 'package:app_web_admin_complex/ui/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration authInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey));
  }

  static InputDecoration searchInputDecoration(
      {required String hint, required IconData icon}) {
    return InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(icon, color: primaryColor),
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)));
  }

  static InputDecoration formInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor.withOpacity(0.3))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor.withOpacity(0.3))),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
        labelStyle: TextStyle(color: Colors.grey.withOpacity(0.7)));
  }
}
