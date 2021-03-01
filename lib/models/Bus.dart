// To parse this JSON data, do
//
//     final bus = busFromJson(jsonString);

import 'dart:convert';

List<Bus> busFromJson(String str) => List<Bus>.from(json.decode(str).map((x) => Bus.fromJson(x)));

String busToJson(List<Bus> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bus {
    Bus({
        this.type,
        this.sponsored,
        this.image,
        this.servideName,
        this.license,
        this.location,
        this.price,
        this.views,
        this.file,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    Type type;
    bool sponsored;
    String image;
    String servideName;
    License license;
    String location;
    String price;
    String views;
    String file;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Bus.fromJson(Map<String, dynamic> json) => Bus(
        type: typeValues.map[json["type"]],
        sponsored: json["sponsored"],
        image: json["image"],
        servideName: json["servide_Name"],
        license: licenseValues.map[json["license"]],
        location: json["location"],
        price: json["price"],
        views: json["views"],
        file: json["file"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "sponsored": sponsored,
        "image": image,
        "servide_Name": servideName,
        "license": licenseValues.reverse[license],
        "location": location,
        "price": price,
        "views": views,
        "file": file,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

enum License { SFDF54_GDSF0_G6_SD50_G0_SD2_FG_SE }

final licenseValues = EnumValues({
    "sfdf54gdsf0g6sd50g0sd2fg+se": License.SFDF54_GDSF0_G6_SD50_G0_SD2_FG_SE
});

enum Type { BUS_OWNER }

final typeValues = EnumValues({
    "Bus-Owner": Type.BUS_OWNER
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
