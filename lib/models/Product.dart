// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
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
    ServideName servideName;
    License license;
    Location location;
    String price;
    String views;
    String file;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        type: typeValues.map[json["type"]],
        sponsored: json["sponsored"],
        image: json["image"],
        servideName: servideNameValues.map[json["servide_Name"]],
        license: licenseValues.map[json["license"]],
        location: locationValues.map[json["location"]],
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
        "servide_Name": servideNameValues.reverse[servideName],
        "license": licenseValues.reverse[license],
        "location": locationValues.reverse[location],
        "price": price,
        "views": views,
        "file": file,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

enum License { SDASD, SFDF54_GDSF0_G6_SD50_G0_SD2_FG_SE }

final licenseValues = EnumValues({
    "sdasd": License.SDASD,
    "sfdf54gdsf0g6sd50g0sd2fg+se": License.SFDF54_GDSF0_G6_SD50_G0_SD2_FG_SE
});

enum Location { DIHAN, PATIHASH, ITIHASH }

final locationValues = EnumValues({
    "Dihan": Location.DIHAN,
    "Itihash": Location.ITIHASH,
    "patihash": Location.PATIHASH
});

enum ServideName { D_IHAN, RTERTERTEWRTERT }

final servideNameValues = EnumValues({
    "DIhan": ServideName.D_IHAN,
    "rtertertewrtert": ServideName.RTERTERTEWRTERT
});

enum Type { BUS_OWNER, HOTEL_OWNER }

final typeValues = EnumValues({
    "Bus-Owner": Type.BUS_OWNER,
    "Hotel-Owner": Type.HOTEL_OWNER
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
