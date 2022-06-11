// To parse this JSON data, do
//
//     final exceptionModel = exceptionModelFromMap(jsonString);
import 'dart:convert';

class ResponseModel {
  ResponseModel(
      {required this.type,
      required this.message,
      this.cause,
      this.fieldUpdate});

  String type;
  String message;
  String? cause;
  String? fieldUpdate;

  factory ResponseModel.fromJson(String str) =>
      ResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromMap(Map<String, dynamic> json) => ResponseModel(
      type: json["type"],
      message: json["message"],
      cause: json["cause"],
      fieldUpdate: json["fieldUpdate"]);

  Map<String, dynamic> toMap() => {
        "type": type,
        "message": message,
        "cause": cause,
        "fieldUpdate": fieldUpdate
      };
}
