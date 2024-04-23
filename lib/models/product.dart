import 'dart:convert';

import 'package:coffee_script_app/helper/constant/method.dart';

List<Product> listCartProductfromJson(String source) => List<Product>.from(
    jsonDecode(source).map((e) => Product.fromMap(e)).toList());

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  int productId;
  String productName;
  String productImage;
  String productType;
  String productDescription;
  bool favourite;
  String productIngredient;
  double productPrice;
  Product({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productType,
    required this.productDescription,
    required this.favourite,
    required this.productIngredient,
    required this.productPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_id': productId,
      'product_name': productName,
      'product_image': productImage,
      'product_type': productType,
      'product_description': productDescription,
      'favourite': favourite,
      'product_ingredient': productIngredient,
      'product_price': productPrice,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: int.parse(map['product_id']),
      productName: map['product_name'] as String,
      productImage: map['product_image'] as String,
      productType: map['product_type'] as String,
      productDescription: map['product_description'] as String,
      favourite: changeBoolString(map['favourite']),
      productIngredient: map['product_ingredient'] as String,
      productPrice: double.parse(map['product_price']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
