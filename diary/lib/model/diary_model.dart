// To parse this JSON data, do
//
//     final diary = diaryFromJson(jsonString);

import 'dart:convert';

List<Diary> diaryFromJson(String str) => List<Diary>.from(json.decode(str).map((x) => Diary.fromJson(x)));

String diaryToJson(List<Diary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Diary {
    Diary({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Diary.fromJson(Map<String, dynamic> json) => Diary(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.user,
        required this.date,
        required this.foodname,
        required this.description,
        required this.isFinished,
        required this.price,
    });

    int user;
    DateTime date;
    String foodname;
    String description;
    bool isFinished;
    int price;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        date: DateTime.parse(json["date"]),
        foodname: json["foodname"],
        description: json["description"],
        isFinished: json["is_finished"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "foodname": foodname,
        "description": description,
        "is_finished": isFinished,
        "price": price,
    };
}
