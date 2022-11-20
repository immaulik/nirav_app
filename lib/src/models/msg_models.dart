// To parse this JSON data, do
//
//     final messages = messagesFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

MessagesModel messagesFromJson(String str) => MessagesModel.fromJson(json.decode(str));

String messagesToJson(MessagesModel data) => json.encode(data.toJson());

class MessagesModel {
  MessagesModel({
    Timestamp? createdAt,
    this.msg = "",
    this.msgType = -1,
    this.sender = "",
    Map<String, dynamic>? status,
  })  : this.createdAt = createdAt ?? Timestamp(0, 0),
        this.status = status ?? {};

  Timestamp createdAt;
  String msg;
  int msgType;
  String sender;
  Map<String, dynamic> status;

  factory MessagesModel.fromJson(Map<String, dynamic> json) => MessagesModel(
        createdAt: json["createdAt"] ?? Timestamp(0, 0),
        msg: json["msg"] ?? "",
        msgType: json["msgType"] ?? -1,
        sender: json["sender"] ?? "",
        status: json["status"] ?? {},
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "msg": msg,
        "msgType": msgType,
        "sender": sender,
        "status": status,
      };
}
