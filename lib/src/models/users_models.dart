import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.name = "",
    this.gender = -1,
    this.country = "",
    this.age = -1,
    this.docId = "",
    Timestamp? createdAt,
  }) : createdAt = createdAt ?? Timestamp(0, 0);

  String name;
  int gender;
  String country;
  int age;
  Timestamp createdAt;
  String docId;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"] ?? "",
        gender: json["gender"] ?? -1,
        country: json["country"] ?? "",
        docId: json["docId"] ?? "",
        age: json["age"] ?? -1,
        createdAt: json["createdAt"] ?? Timestamp(0, 0),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "country": country,
        "docId": docId,
        "age": age,
        "createdAt": createdAt,
      };
}
