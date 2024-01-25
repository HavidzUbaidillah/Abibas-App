import 'dart:convert';

import 'package:abibas_app/controller/api.dart';
import 'package:abibas_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> login() async {
    print("orang");
    Get.snackbar('Success', 'Berhasil registrasi!');

    var headers = {'Content-Type': 'application/json'};
    try {
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login);
      Map body = {
        'username': usernameController.text.trim(),
        'password': passwordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['errors'] == null) {
          var token = json['data']['token'];
          await _saveTokenToSharedPreferences(token);
          print(token);

          usernameController.clear();
          passwordController.clear();
          Get.off(const HomePage());
        }
      } else {
        throw jsonDecode(response.body)["errors"] ?? "Unknown Error Occurred";
      }
    } catch (error) {
      print("errors");
      Get.snackbar('Errors', 'Berhasil registrasi!');

      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Error'),
            contentPadding: const EdgeInsets.all(20),
            children: [Text(error.toString())],
          );
        },
      );
    }
  }

  Future<void> _saveTokenToSharedPreferences(String token) async {
    try {
      final SharedPreferences prefs = await _prefs;
      await prefs.setString('token', token);
      final String? token1 = prefs.getString('token');
      print(token1);
    } catch (error) {
      print('Error menyimpan shared preferences: $error');
    }
  }
}
