// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

class User {
  User({
    @required this.name,
    this.email,
    this.phone,
    this.photoUrl,
    this.nid,
    this.type,
    this.role,
    this.address,
  });

  String name;
  String email;
  String phone;
  String photoUrl;
  String nid;
  String type;
  String role;
  String address;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    photoUrl: json["photoURL"] == null ? null : json["photoURL"],
    nid: json["nid"] == null ? null : json["nid"],
    type: json["type"] == null ? null : json["type"],
    role: json["role"] == null ? null : json["role"],
    address: json["address"] == null ? null : json["address"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "photoURL": photoUrl == null ? null : photoUrl,
    "nid": nid == null ? null : nid,
    "type": type == null ? null : type,
    "role": role == null ? null : role,
    "address": address == null ? null : address,
  };
}
