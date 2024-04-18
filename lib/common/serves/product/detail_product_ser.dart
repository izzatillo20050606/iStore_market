import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phone_store/common/serves/baseOptions/baseOptions.dart';
import 'package:phone_store/data/entitiy/detail_getProduct.dart';

class ProductDetailServices {
  static List<GetDetailProduct> productDetail = [];

  static Dio dio = Dio(BaseOptionss.baseOptions);
  static Future<void> getProducts(int id,) async {
    try {
      var response = await dio.get('/products/$id/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = response.data;
        GetDetailProduct product = GetDetailProduct.fromJson(data);
        productDetail.add(
          GetDetailProduct(
            id: product.id,
            name: product.name,
            release: product.release,
            specs: product.specs
                .map((spec) => Spec(title: spec.title, text: spec.text))
                .toList(),
            images: List<String>.from(product.images),
          ),
        );
        debugPrint('\x1B[33m MALUMOTLARI : ${productDetail.length}.\x1B[0m');
      } else {
        print(
            "Serverdan ma'lumotlar olinmadi. Xatolik: ${response.statusCode}");
      }
    } catch (e) {
      print("Xatolik yuz berdi: $e");
    }
  }

  // static getProductDetail(String s, BuildContext context) {}
}
