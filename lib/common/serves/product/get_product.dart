import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phone_store/common/serves/baseOptions/baseOptions.dart';
import 'package:phone_store/data/entitiy/product_model.dart';

class ProductServices {
  static List<Product> macbookList = [];
  static List<Product> iphoneList = [];
  static List<Product> watchList = [];
  static List<Product> airPodsList = [];
  static Dio dio = Dio(BaseOptionss.baseOptions);

  /// macbook
  static Future<void> getProductMacbook() async {
    macbookList.clear();
    try {
      var response =
          await dio.get('/products/main/?category_id=1&search=macbook');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var productList = List<Product>.from(
            response.data["products"].map((x) => Product.fromJson(x)));
        macbookList.addAll(productList);
        debugPrint('MACBOOK SONI :${macbookList.length}');
      } else {
        print(
            "Serverdan ma'lumotlar olinmadi. Xatolik: ${response.statusCode}");
      }
    } catch (e) {
      print("Xatolik yuz berdi: $e");
    }
  }

  static Future<void> getProductIphone() async {
    iphoneList.clear();
    try {
      var response =
          await dio.get('/products/main/?category_id=2&search=Iphone');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var productList = List<Product>.from(
            await response.data["products"].map((x) => Product.fromJson(x)));
        iphoneList.addAll(productList);
        debugPrint('Iphonelar SONI :${iphoneList.length}');
      } else {
        print(
            "Serverdan ma'lumotlar olinmadi. Xatolik: ${response.statusCode}");
      }
    } catch (e) {
      print("Xatolik yuz berdi: $e");
    }
  }

  static Future<void> getProductWatch() async {
    watchList.clear();
    try {
      var response =
          await dio.get('/products/main/?category_id=3&search=Watch');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var productList = List<Product>.from(
            await response.data["products"].map((x) => Product.fromJson(x)));
        watchList.addAll(productList);
        debugPrint('MACBOOK SONI :${watchList.length}');
      } else {
        print(
            "Serverdan ma'lumotlar olinmadi. Xatolik: ${response.statusCode}");
      }
    } catch (e) {
      print("Xatolik yuz berdi: $e");
    }
  }

  static Future<void> getProductAirPods() async {
    airPodsList.clear();
    try {
      var response =
          await dio.get('/products/main/?category_id=4&search=AirPods');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var productList = List<Product>.from(
            await response.data["products"].map((x) => Product.fromJson(x)));
        airPodsList.addAll(productList);
        debugPrint('MACBOOK SONI :${airPodsList.length}');
      } else {
        print(
            "Serverdan ma'lumotlar olinmadi. Xatolik: ${response.statusCode}");
      }
    } catch (e) {
      print("Xatolik yuz berdi: $e");
    }
  }

  static Future<void> getAllProducts() async {
    await ProductServices.getProductMacbook();
    await ProductServices.getProductIphone();
    await ProductServices.getProductWatch();
    await ProductServices.getProductAirPods();
  }
}
