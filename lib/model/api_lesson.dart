// To parse this JSON data, do
//
//     final geAllLesson = geAllLessonFromJson(jsonString);

import 'dart:convert';

List<GeAllLesson> geAllLessonFromJson(String str) => List<GeAllLesson>.from(json.decode(str).map((x) => GeAllLesson.fromJson(x)));

String geAllLessonToJson(List<GeAllLesson> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GeAllLesson {
    int? id;
    int? lessonNum;
    String? titel;
    Season? season;

    GeAllLesson({
        this.id,
        this.lessonNum,
        this.titel,
        this.season,
    });

    factory GeAllLesson.fromJson(Map<String, dynamic> json) => GeAllLesson(
        id: json["id"],
        lessonNum: json["lesson_num"],
        titel: json["titel"],
        season: json["season"] == null ? null : Season.fromJson(json["season"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lesson_num": lessonNum,
        "titel": titel,
        "season": season?.toJson(),
    };
}

class Season {
    int? id;
    int? seasonNum;
    String? titel;

    Season({
        this.id,
        this.seasonNum,
        this.titel,
    });

    factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["id"],
        seasonNum: json["season_num"],
        titel: json["titel"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "season_num": seasonNum,
        "titel": titel,
    };
}
