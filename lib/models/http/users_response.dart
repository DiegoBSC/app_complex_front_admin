// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromMap(jsonString);

import 'package:app_web_admin_complex/models/user_presenter_model.dart';
import 'dart:convert';

class UsersResponse {
  UsersResponse({
    required this.totalPages,
    required this.totalElements,
    required this.data,
  });

  int totalPages;
  int totalElements;
  List<UserPresenter> data;

  factory UsersResponse.fromJson(String str) =>
      UsersResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsersResponse.fromMap(Map<String, dynamic> json) => UsersResponse(
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        data: List<UserPresenter>.from(
            json["data"].map((x) => UserPresenter.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "totalPages": totalPages,
        "totalElements": totalElements,
        "data": List<UserPresenter>.from(data.map((x) => x.toMap())),
      };
}
