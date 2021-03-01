// To parse this JSON data, do
//
//     final oAuthAccessToken = oAuthAccessTokenFromMap(jsonString);

import 'dart:convert';

import 'User.dart';

class OAuthAccessToken {
  OAuthAccessToken({
    this.scope,
    this.id,
    this.accessToken,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  List<dynamic> scope;
  String id;
  String accessToken;
  User user;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory OAuthAccessToken.fromJson(String str) => OAuthAccessToken.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OAuthAccessToken.fromMap(Map<String, dynamic> json) => OAuthAccessToken(
    scope: json["scope"] == null ? null : List<dynamic>.from(json["scope"].map((x) => x)),
    id: json["_id"] == null ? null : json["_id"],
    accessToken: json["access_token"] == null ? null : json["access_token"],
    user: json["user"] == null ? null : User.fromMap(json["user"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "scope": scope == null ? null : List<dynamic>.from(scope.map((x) => x)),
    "_id": id == null ? null : id,
    "access_token": accessToken == null ? null : accessToken,
    "user": user == null ? null : user.toMap(),
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "__v": v == null ? null : v,
  };
}