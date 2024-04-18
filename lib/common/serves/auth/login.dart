import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phone_store/data/entitiy/Login_model.dart';
import 'package:phone_store/main.dart';

class AuthLoginServices {
  static Dio dio = Dio();

  static Future<void> getToken(
    LoginModel data,
  ) async {
    try {
      var response = await dio.post(
          'http://16.171.145.111:8000/accounts/login/',data: data.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = response.data as Map<String, dynamic>;
        String? accessToken = responseData["access"] as String?;
        if (accessToken != null) {
          debugPrint("Access Token: $accessToken");
          await box.put('token', accessToken);
          debugPrint(box.get('token'));
        } else {
          return;
        }
      } else {
        return;
      }
    } catch (e) {
      return;
    }
  }
}
