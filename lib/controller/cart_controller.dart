import 'package:coffee_script_app/models/cart_item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxList<CartItem> cartProductList = List<CartItem>.empty(growable: true).obs;
}
