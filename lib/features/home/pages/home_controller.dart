import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_store/common/serves/product/get_product.dart';
import 'package:phone_store/data/repazetoriy/app_repazetoriy_implements.dart';
import 'package:shared_preferences/shared_preferences.dart';

final homeController =
    ChangeNotifierProvider.autoDispose((ref) => HomeController());

class HomeController extends ChangeNotifier {
  HomeController() {
    getproductt();
    all();
    getAll();
  }
  void getproductt() async {
    await ProductServices.getAllProducts();
    notifyListeners();
  }

  AppRepazetoriyImplement implement = AppRepazetoriyImplement();
  List list = [];
  Future<void> getAll() async {
    list = await implement.getAll();
    await ProductServices.getAllProducts();
    notifyListeners();
  }

  bool isCamera = false;
  bool isFileSelected = false;
  String? path;

  Future<void> getImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isFileSelected = false;
    final picker = ImagePicker();
    XFile? xFile = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (xFile != null) {
      await prefs.setString("image", xFile.path);
      path = await read();
      if (path != null) {
        isFileSelected = true;
        notifyListeners();
      }
      notifyListeners();
    }
  }

  Future<String?> read() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("image");
  }

  Future<void> all() async {
    path = await read();
    if (path != null) {
      isFileSelected = true;
      notifyListeners();
    }
  }
}
