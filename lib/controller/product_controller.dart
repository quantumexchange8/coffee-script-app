import 'package:coffee_script_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  RxList<Product> productList = List<Product>.empty(growable: true).obs;

  Future<bool> getProductList() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummyData/product.json');
      productList.value = listCartProductfromJson(response);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
