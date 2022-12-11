import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:send_foodwaste/models/send_foodwaste_model.dart';
import 'package:fooody/common/cookie_request.dart';

Future<List<SendFoodWasteModel>> fetchFoodWaste(CookieRequest request) async {
    var url =
        Uri.parse('https://fooodybuddy.up.railway.app/send_foodwaste/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<SendFoodWasteModel> listFoodWaste = [];
    for (var d in data) {
      if (d != null) {
        listFoodWaste.add(SendFoodWasteModel.fromJson(d));
      }
    }

    return listFoodWaste;
  }