import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static final String baseUrl = 'http://10.10.10.161:3000/api/v1/';

  static Future<Map<String, String>> getHeaders() async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    String? token = localstorage.getString('token');

    if (token != null) {
      return {'Authorization': 'Bearer $token'};
    } else {
      return {};
    }
  }
}
