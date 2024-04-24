import 'dart:convert';

import 'package:coffee_script_app/models/cart_item.dart';
import 'package:coffee_script_app/models/timeline.dart';

class Order {
  int id;
  List<CartItem> cartItems;
  double totalPrice;
  String status;
  List<TimelineModel> timeline;

  Order(
      {required this.id,
      required this.cartItems,
      required this.totalPrice,
      required this.status,
      required this.timeline});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cart_items': cartItems,
      'total_price': totalPrice,
      'status': status,
      'timeline': timeline,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    List<Map<String, dynamic>> timelineMap = map['timeline'];

    return Order(
        id: map['id'] as int,
        cartItems: map['cart_items'],
        totalPrice: double.parse(
          map['total_price'].toString(),
        ),
        status: map['status'] as String,
        timeline: timelineMap.map((e) => TimelineModel.fromMap(e)).toList());
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
