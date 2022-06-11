// To parse this JSON data, do
//
//     final authResponse = authResponseFromMap(jsonString);

import 'dart:convert';

import 'package:app_web_admin_complex/models/user_presenter_model.dart';

class AuthResponse {
  AuthResponse({
    required this.token,
    required this.userPresenter,
  });

  String token;
  UserPresenter userPresenter;

  factory AuthResponse.fromJson(String str) =>
      AuthResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        token: json["token"],
        userPresenter: UserPresenter.fromMap(json["userPresenter"]),
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "userPresenter": userPresenter.toMap(),
      };
}
