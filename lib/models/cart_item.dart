import 'dart:convert';

import 'package:coffee_script_app/models/product.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItem {
  Product product;
  int productCount;
  CartItem({
    required this.product,
    required this.productCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product,
      'product_count': productCount,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      product: Product.fromMap(map['product']),
      productCount: 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source));
}
