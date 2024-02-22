// register_controller.dart
import 'dart:convert';

import '../../../providers/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  var username = ''.obs;
  var fullname = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  void onUsernameChanged(String value) {
    username.value = value;
  }

  void onFullnameChanged(String value) {
    fullname.value = value;
  }

  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  Future<void> register() async {
    try {
      var response = await _performRegistration();
      var responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        _saveUserData(responseBody);
       Get.offAllNamed('/login');// Navigate to the home page after registration
      } else {
        // Registration failed, handle the error
        Get.snackbar(
            'Error', 'Registration failed. ${responseBody['message']}');
      }
    } catch (e) {
      // Handle other errors
      // Handle other errors
      print('Error during registration: $e');
      Get.snackbar('Error', 'An error occurred during registration. $e');
    }
  }

  Future<http.Response> _performRegistration() async {
    var apiUrl = 'auth/register';
    var requestBody = {
      'username': username.value,
      'fullname': fullname.value,
      'email': email.value,
      'password': password.value,
      'role': 'user'
    };

    return await http.post(
      Uri.parse(Api.baseUrl + apiUrl),
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );
  }

  void _saveUserData(Map<String, dynamic> responseBody) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('user', json.encode(responseBody['data']));
  }

  void goToLogin() {
    // Use Get.toNamed to navigate to the login page
    Get.toNamed('/login');
  }
}
