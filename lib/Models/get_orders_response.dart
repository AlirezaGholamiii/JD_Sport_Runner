import 'dart:convert';

import 'order.dart';

class ListOforders {
  ListOforders({
    this.code,
    this.message,
    this.listOforders,
  });

  String? code;
  String? message;
  List<order>? listOforders;

  factory ListOforders.fromRawJson(String str) =>
      ListOforders.fromJson(json.decode(str));

  factory ListOforders.fromJson(Map<String, dynamic> json) => ListOforders(
        code: json["code"],
        message: json["message"],
        listOforders: List<order>.from(
            json["listOforders"].map((x) => order.fromJson(x))),
      );
}
