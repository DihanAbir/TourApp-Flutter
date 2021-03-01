// To parse this JSON data, do
//
//     final story = storyFromJson(jsonString);

import 'dart:convert';

Story storyFromJson(String str) => Story.fromJson(json.decode(str));

String storyToJson(Story data) => json.encode(data.toJson());

class Story {
    Story({
        this.url,
        this.media,
        this.duration,
    });

    String url;
    String media;
    String duration;

    factory Story.fromJson(Map<String, dynamic> json) => Story(
        url: json["url"],
        media: json["media"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "media": media,
        "duration": duration,
    };
}
