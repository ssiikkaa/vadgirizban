// To parse this JSON data, do
//
//     final geAllVocabulary = geAllVocabularyFromJson(jsonString);

import 'dart:convert';

List<GeAllVocabulary> geAllVocabularyFromJson(String str) => List<GeAllVocabulary>.from(json.decode(str).map((x) => GeAllVocabulary.fromJson(x)));

String geAllVocabularyToJson(List<GeAllVocabulary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GeAllVocabulary {
    int? id;
    String? mainWord;
    String? meaningWord;
    String? mainSentence;
    String? meaningSentence;
    String? image;
    Lesson? lesson;
    Season? season;

    GeAllVocabulary({
        this.id,
        this.mainWord,
        this.meaningWord,
        this.mainSentence,
        this.meaningSentence,
        this.image,
        this.lesson,
        this.season,
    });

    factory GeAllVocabulary.fromJson(Map<String, dynamic> json) => GeAllVocabulary(
        id: json["id"],
        mainWord: json["main_word"],
        meaningWord: json["meaning_word"],
        mainSentence: json["main_sentence"],
        meaningSentence: json["meaning_sentence"],
        image: json["image"],
        lesson: json["lesson"] == null ? null : Lesson.fromJson(json["lesson"]),
        season: json["season"] == null ? null : Season.fromJson(json["season"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main_word": mainWord,
        "meaning_word": meaningWord,
        "main_sentence": mainSentence,
        "meaning_sentence": meaningSentence,
        "image": image,
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
