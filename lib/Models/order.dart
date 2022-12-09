import 'dart:convert';

class order {
  order({
    this.ticket,
    this.status,
    this.requester,
    this.runner,
    this.description,
    this.color,
    this.size,
    this.reqTime,
  });

  String? ticket;
  String? status;
  String? requester;
  String? runner;
  String? description;
  String? color;
  String? size;
  DateTime? reqTime;

  factory order.fromRawJson(String str) => order.fromJson(json.decode(str));

  factory order.fromJson(Map<String, dynamic> json) => order(
        ticket: json["ticket"],
        status: json["status"],
        requester: json["requester"],
        runner: json["runner"],
        description: json["description"],
        color: json["color"],
        size: json["size"],
        reqTime: DateTime.parse(json["reqTime"]),
      );
}
