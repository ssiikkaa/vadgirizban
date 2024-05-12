// To parse this JSON data, do
//
//     final geAllGrammer = geAllGrammerFromJson(jsonString);

import 'dart:convert';

List<GeAllGrammer> geAllGrammerFromJson(String str) => List<GeAllGrammer>.from(json.decode(str).map((x) => GeAllGrammer.fromJson(x)));

String geAllGrammerToJson(List<GeAllGrammer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GeAllGrammer {
    int? id;
    String? titel;
    String? mainExampleOne;
    String? mainExampleTwo;
    String? mainExampleThree;
    String? meaningExampleOne;
    String? meaningExampleTwo;
    String? meaningExampleThree;
    Lesson? lesson;
    Season? season;

    GeAllGrammer({
        this.id,
        this.titel,
        this.mainExampleOne,
        this.mainExampleTwo,
        this.mainExampleThree,
        this.meaningExampleOne,
        this.meaningExampleTwo,
        this.meaningExampleThree,
        this.lesson,
        this.season,
    });

    factory GeAllGrammer.fromJson(Map<String, dynamic> json) => GeAllGrammer(
        id: json["id"],
        titel:utf8.decode(json["titel"].codeUnits) ,
        mainExampleOne: json["main_example_one"],
        mainExampleTwo: json["main_example_two"],
        mainExampleThree: json["main_example_three"],
        meaningExampleOne:utf8.decode( json["meaning_example_one"].codeUnits),
        meaningExampleTwo:utf8.decode( json["meaning_example_two"].codeUnits),
        meaningExampleThree:utf8.decode(json["meaning_example_three"].codeUnits) ,
        lesson: json["lesson"] == null ? null : Lesson.fromJson(json["lesson"]),
        season: json["season"] == null ? null : Season.fromJson(json["season"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titel": titel,
        "main_example_one": mainExampleOne,
        "main_example_two": mainExampleTwo,
        "main_example_three": mainExampleThree,
        "meaning_example_one": meaningExampleOne,
        "meaning_example_two": meaningExampleTwo,
        "meaning_example_three": meaningExampleThree,
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
