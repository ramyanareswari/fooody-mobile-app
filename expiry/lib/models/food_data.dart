// To parse this JSON data, do
//
//     final WatchList = WatchListFromJson(jsonString);

import 'dart:convert';

List<FoodData> foodDataFromJson(String str) =>
    List<FoodData>.from(json.decode(str).map((x) => FoodData.fromJson(x)));

String foodDataToJson(List<FoodData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodData {
  FoodData({
    required this.food_name,
    required this.food_expired_date,
  });

  // user = models.ForeignKey(User, on_delete = models.CASCADE)
  String food_name;
  DateTime food_expired_date;

  factory FoodData.fromJson(Map<String, dynamic> json) => FoodData(
        food_name: json["fields"]["food_name"],
        food_expired_date: json["fields"]["food_expired_date"],
      );

  Map<String, dynamic> toJson() => {
        "food_name": food_name,
        "food_expired_date": food_expired_date,
      };
}
