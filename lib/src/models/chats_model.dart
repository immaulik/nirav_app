import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ChatsModel chatsFromJson(String str) => ChatsModel.fromJson(json.decode(str));

String chatsToJson(ChatsModel data) => json.encode(data.toJson());

class ChatsModel {
  ChatsModel({
    List<String>? users,
    List<String>? inboxFor,
    Timestamp? createdAt,
    this.sender = "",
    this.lastMsg = "",
    Map<String, dynamic>? unReadFlag,
  })  : this.users = users ?? [],
        this.inboxFor = inboxFor ?? [],
        this.createdAt = createdAt ?? Timestamp(0, 0),
        this.unReadFlag = unReadFlag ?? {};

  List<String> users;
  List<String> inboxFor;
  Timestamp createdAt;
  String sender;
  String lastMsg;
  Map<String, dynamic> unReadFlag;

  factory ChatsModel.fromJson(Map<String, dynamic> json) => ChatsModel(
        users: json["users"] != null
            ? List<String>.from(json["users"].map((x) => x))
            : [],
        inboxFor: json["inboxFor"] != null
            ? List<String>.from(json["inboxFor"].map((x) => x))
            : [],
        createdAt: json["created_at"] ?? Timestamp(0, 0),
        sender: json["sender"] ?? "",
        lastMsg: json["lastMsg"] ?? "",
        unReadFlag: json["unReadFlag"] ?? {},
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x)),
        "inboxFor": List<dynamic>.from(inboxFor.map((x) => x)),
        "created_at": createdAt,
        "sender": sender,
        "lastMsg": lastMsg,
        "unReadFlag": unReadFlag,
      };
}
