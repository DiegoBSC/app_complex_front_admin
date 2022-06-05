// To parse this JSON data, do
//
//     final complexResponse = complexResponseFromMap(jsonString);

import 'dart:convert';

List<ComplexResponse> complexResponseFromMap(String str) =>
    List<ComplexResponse>.from(
        json.decode(str).map((x) => ComplexResponse.fromMap(x)));

String complexResponseToMap(List<ComplexResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ComplexResponse {
  ComplexResponse(
      {required this.id,
      required this.name,
      this.logo,
      required this.mainStreet,
      required this.sideStreet,
      required this.numeration,
      required this.reference,
      required this.latitude,
      required this.longitude,
      required this.description,
      required this.primaryColor,
      required this.secondaryColor,
      required this.extraColor,
      required this.status});

  String id;
  String name;
  String? logo;
  String mainStreet;
  String sideStreet;
  String numeration;
  String reference;
  double latitude;
  double longitude;
  String description;
  String primaryColor;
  String secondaryColor;
  String extraColor;
  String status;

  factory ComplexResponse.fromMap(Map<String, dynamic> json) => ComplexResponse(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        mainStreet: json["mainStreet"],
        sideStreet: json["sideStreet"],
        numeration: json["numeration"],
        reference: json["reference"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        description: json["description"],
        primaryColor: json["primaryColor"],
        secondaryColor: json["secondaryColor"],
        extraColor: json["extraColor"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "logo": logo,
        "mainStreet": mainStreet,
        "sideStreet": sideStreet,
        "numeration": numeration,
        "reference": reference,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
        "primaryColor": primaryColor,
        "secondaryColor": secondaryColor,
        "extraColor": extraColor,
        "status": status,
      };
}
