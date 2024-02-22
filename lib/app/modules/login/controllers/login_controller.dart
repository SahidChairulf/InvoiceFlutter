import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/api.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var username = ''.obs;
  var password = ''.obs;

  void onUsernameChanged(String value) {
    username.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  Future<void> login() async {
    try {
      var response = await _perfomLogin();
      var responseBody = json.decode(response.body);
      print(responseBody);

      if (response.statusCode == 200 && responseBody['token'] != null) {
        _saveUserData(responseBody);

        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Error', 'Login Failed. ${responseBody['message']}');
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }

  Future<http.Response> _perfomLogin() async {
    var apiUrl = 'auth/login';
    var requestBody = {'username': username.value, 'password': password.value};

    return await http.post(Uri.parse(Api.baseUrl + apiUrl),
        body: jsonEncode(requestBody),
        headers: {'Content-Type': 'application/json'});
  }

  void _saveUserData(Map<String, dynamic> responseBody) async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    localstorage.setString('token', responseBody['token']);
    localstorage.setString('user', json.encode(responseBody['user']));
  }

  void goToRegister() {
    Get.toNamed('/register');
  }
}
