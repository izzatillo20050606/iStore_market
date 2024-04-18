import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phone_store/data/entitiy/category_mode.dart';
import 'package:phone_store/main.dart';
import 'package:http/http.dart';

List<Category> categoryMacbookList = [];
List<Category> categoryPhoneList = [];
List<Category> categoryWatchList = [];
List<Category> categoryAirPodsList = [];
Dio dio = Dio();

// class NetworkServes {
//   static const baseUrl = "16.171.145.111:8000";
//   static const apipos = "/accounts/register/";
//   static const apilogin = "/accounts/login/";
//   static const apigetCote = "/products/main/";
//   static const headers = {"Content-Type": "application/json"};

//   static Future<String?> read(String api, Map<String, dynamic> body) async {
//     final url = Uri.http(baseUrl, api);
//     final response = await post(url, headers: headers, body: jsonEncode(body));
//     if (response.statusCode == 200 && response.statusCode == 201) {
//       debugPrint('2000000');
//       return response.body;
//     } else {
//       return null;
//     }
//   }

//   static Future<String?> loginpost(
//       String api, Map<String, dynamic> body) async {
//     final url = Uri.http(baseUrl, api);
//     final response = await post(url, headers: headers, body: jsonEncode(body));
//     preferences.setString("accses_token", jsonDecode(response.body)["access"]);
//     if (response.statusCode == 200 && response.statusCode == 201) {
//       return response.body;
//     } else {
//       return null;
//     } 
//   }

//   static Future<void> getAllData(String api) async {
//     Dio dio = Dio();
//     var response = await dio.get(baseUrl);
//     categoryMacbookList =
//         (response.data as List).map((e) => Category.fromJson(e)).toList();
//   }

//   static fetchData(String apigetCote) {}
// }
class NetworkServes {
  static const baseUrl = "http://16.171.145.111:8000"; // Add "http://" prefix
  static const apipos = "/accounts/register/";
  static const apilogin = "/accounts/login/";
  static const apigetCote = "/products/main/";
  static const headers = {"Content-Type": "application/json"};

  static Future<String?> read(String api, Map<String, dynamic> body) async {
    final url = Uri.http(baseUrl, api);
    final response = await post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('2000000');
      return response.body;
    } else {
      return null;
    }
  }

  static Future<String?> loginpost(String api, Map<String, dynamic> body) async {
    final url = Uri.http(baseUrl, api);
    final response = await post(url, headers: headers, body: jsonEncode(body));
    preferences.setString("accses_token", jsonDecode(response.body)["access"]);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    } 
  }

  static Future<void> getAllData(String api) async {
    Dio dio = Dio();
    var response = await dio.get('$baseUrl$api'); // Include the api endpoint
    categoryMacbookList =
        (response.data as List).map((e) => Category.fromJson(e)).toList();
  }

  static Future<List<Category>> fetchData(String apigetCote) async {
  try {
    var response = await dio.get('$baseUrl$apigetCote');
    if (response.statusCode == 200) {
      List<Category> products = (response.data as List)
          .map((e) => Category.fromJson(e))
          .toList();
      return products;
    } else {
      // If the request was not successful, return an empty list
      return [];
    }
  } catch (e) {
    // If an error occurs during the request, return an empty list
    print("Error fetching data: $e");
    return [];
  }
}

}
