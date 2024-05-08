// To parse this JSON data, do
//
//     final geAllSpeaking = geAllSpeakingFromJson(jsonString);

import 'dart:convert';

List<GeAllSpeaking> geAllSpeakingFromJson(String str) => List<GeAllSpeaking>.from(json.decode(str).map((x) => GeAllSpeaking.fromJson(x)));

String geAllSpeakingToJson(List<GeAllSpeaking> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GeAllSpeaking {
    int? id;
    String? mainSentence;
    String? meaningSentence;
    Lesson? lesson;
    Season? season;

    GeAllSpeaking({
        this.id,
        this.mainSentence,
        this.meaningSentence,
        this.lesson,
        this.season,
    });

    factory GeAllSpeaking.fromJson(Map<String, dynamic> json) => GeAllSpeaking(
        id: json["id"],
        mainSentence: json["main_sentence"],
        meaningSentence:utf8.decode(json["meaning_sentence"].codeUnits) ,
        lesson: json["lesson"] == null ? null : Lesson.fromJson(json["lesson"]),
        season: json["season"] == null ? null : Season.fromJson(json["season"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main_sentence": mainSentence,
        "meaning_sentence": meaningSentence,
        "lesson": lesson?.toJson(),
        "season": season?.toJson(),
    };
}

class Lesson {
    int? id;
    int? lessonNum;
    String? titel;
    int? season;

    Lesson({
        this.id,
        this.lessonNum,
        this.titel,
        this.season,
    });

    factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        lessonNum: json["lesson_num"],
        titel: json["titel"],
        season: json["season"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lesson_num": lessonNum,
        "titel": titel,
        "season": season,
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
