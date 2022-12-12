import 'package:send_foodwaste/models/send_foodwaste_model.dart';
import 'package:fooody/common/cookie_request.dart';

Future<List<SendFoodWasteModel>> fetchFoodWaste(CookieRequest request) async {
  var response = await request.get(
    'https://fooodybuddy.up.railway.app/send_foodwaste/json/',
  );

  // melakukan konversi data json menjadi object ToDo
  List<SendFoodWasteModel> listFoodWaste = [];
  for (var d in response) {
    if (d != null) {
      listFoodWaste.add(SendFoodWasteModel.fromJson(d));
    }
  }

  return listFoodWaste;
}
