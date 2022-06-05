import 'dart:convert';

import 'package:app_web_admin_complex/api/cafe_api.dart';
import 'package:app_web_admin_complex/models/http/auth_response.dart';
import 'package:app_web_admin_complex/models/http/complex_response.dart';
import 'package:flutter/material.dart';

class ComplexProvider extends ChangeNotifier {
  List<ComplexResponse> complexes = [];

  getComplexes(UserPresenter user) async {
    final resp = await CafeApi.httpGet('/v1/complex/user/${user.id}');
    final listResponse = complexResponseFromMap(jsonEncode(resp));
    complexes = [...listResponse];
    notifyListeners();
  }
}
