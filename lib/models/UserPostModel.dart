

import 'dart:convert';

List<UserPostModel> userPostModelFromJson(String str) => List<UserPostModel>.from(json.decode(str).map((x) => UserPostModel.fromJson(x)));

String userPostModelToJson(List<UserPostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserPostModel {
    UserPostModel({
        this.description,
        this.location,
        this.feelings,
        this.photoUrl,
        this.views,
        this.reviesModel,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String description;
    String location;
    String feelings;
    String photoUrl;
    int views;
    ReviesModel reviesModel;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory UserPostModel.fromJson(Map<String, dynamic> json) => UserPostModel(
        description: json["description"],
        location: json["location"],
        feelings: json["feelings"],
        photoUrl: json["photoUrl"],
        views: json["views"],
        reviesModel: reviesModelValues.map[json["revies_Model"]],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "location": location,
        "feelings": feelings,
        "photoUrl": photoUrl,
        "views": views,
        "revies_Model": reviesModelValues.reverse[reviesModel],
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

enum ReviesModel { WOW }

final reviesModelValues = EnumValues({
    "wow": ReviesModel.WOW
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
