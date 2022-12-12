// To parse this JSON data, do
//
//     final sendFoodWasteModel = sendFoodWasteModelFromJson(jsonString);

import 'dart:convert';

List<SendFoodWasteModel> sendFoodWasteModelFromJson(String str) =>
    List<SendFoodWasteModel>.from(
        json.decode(str).map((x) => SendFoodWasteModel.fromJson(x)));

String sendFoodWasteModelToJson(List<SendFoodWasteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SendFoodWasteModel {
  SendFoodWasteModel({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory SendFoodWasteModel.fromJson(Map<String, dynamic> json) =>
      SendFoodWasteModel(
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
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.foodType,
    required this.expiryDate,
    required this.weight,
  });

  int user;
  String name;
  String phoneNumber;
  String address;
  String foodType;
  DateTime expiryDate;
  int weight;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        foodType: json["food_type"],
        expiryDate: DateTime.parse(json["expiry_date"]),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "phone_number": phoneNumber,
        "address": address,
        "food_type": foodType,
        "expiry_date":
            "${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}",
        "weight": weight,
      };
}
