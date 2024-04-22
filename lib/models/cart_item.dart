import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItem {
  int productId;
  String productImage;
  String productName;
  String productIngredient;
  double productPrice;
  int productCount;
  CartItem({
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productIngredient,
    required this.productPrice,
    required this.productCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_id': productId,
      'product_image': productImage,
      'product_name': productName,
      'product_ingredient': productIngredient,
      'product_price': productPrice,
      'product_count': productCount,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      productId: map['product_id'] as int,
      productImage: map['product_image'] as String,
      productName: map['product_name'] as String,
      productIngredient: map['product_ingredient'] as String,
      productPrice: double.parse(map['product_price']),
      productCount: 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source));
}
