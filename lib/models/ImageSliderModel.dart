import 'dart:convert';

class ImageSlider {
    ImageSlider({
        this.type,
        this.id,
        this.image,
    });

    String type;
    String id;
    String image;

    factory ImageSlider.fromJson(String str) => ImageSlider.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ImageSlider.fromMap(Map<String, dynamic> json) => ImageSlider(
        type: json["type"] == null ? null : json["type"],
        id: json["_id"] == null ? null : json["_id"],
        image: json["image"] == null ? null : json["image"],
    );

    Map<String, dynamic> toMap() => {
        "type": type == null ? null : type,
        "_id": id == null ? null : id,
        "image": image == null ? null : image,
    };
}
