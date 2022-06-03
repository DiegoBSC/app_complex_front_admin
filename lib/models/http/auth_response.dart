// To parse this JSON data, do
//
//     final authResponse = authResponseFromMap(jsonString);

import 'dart:convert';

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

class UserPresenter {
  UserPresenter({
    required this.id,
    required this.username,
    required this.telephone,
    required this.email,
    required this.password,
    required this.status,
    required this.rolesPresenter,
    required this.createdDate,
  });

  String id;
  String username;
  String telephone;
  String email;
  String password;
  String status;
  List<RolesPresenter> rolesPresenter;
  DateTime createdDate;

  factory UserPresenter.fromJson(String str) =>
      UserPresenter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserPresenter.fromMap(Map<String, dynamic> json) => UserPresenter(
        id: json["id"],
        username: json["username"],
        telephone: json["telephone"],
        email: json["email"],
        password: json["password"],
        status: json["status"],
        rolesPresenter: List<RolesPresenter>.from(
            json["rolesPresenter"].map((x) => RolesPresenter.fromMap(x))),
        createdDate: DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "telephone": telephone,
        "email": email,
        "password": password,
        "status": status,
        "rolesPresenter":
            List<dynamic>.from(rolesPresenter.map((x) => x.toMap())),
        "createdDate":
            "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
      };
}

class RolesPresenter {
  RolesPresenter({
    required this.id,
    required this.name,
    required this.status,
    required this.permissionsPresenters,
  });

  String id;
  String name;
  String status;
  List<dynamic> permissionsPresenters;

  factory RolesPresenter.fromJson(String str) =>
      RolesPresenter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RolesPresenter.fromMap(Map<String, dynamic> json) => RolesPresenter(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        permissionsPresenters:
            List<dynamic>.from(json["permissionsPresenters"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "status": status,
        "permissionsPresenters":
            List<dynamic>.from(permissionsPresenters.map((x) => x)),
      };
}
