// To parse this JSON data, do
//
//     final exceptionModel = exceptionModelFromMap(jsonString);
import 'dart:convert';

class ExceptionModel {
  ExceptionModel({
    required this.type,
    required this.message,
    required this.cause,
  });

  String type;
  String message;
  String cause;

  factory ExceptionModel.fromJson(String str) =>
      ExceptionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExceptionModel.fromMap(Map<String, dynamic> json) => ExceptionModel(
        type: json["type"],
        message: json["message"],
        cause: json["cause"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "message": message,
        "cause": cause,
      };
}
