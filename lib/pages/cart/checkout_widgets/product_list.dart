import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/method.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Widget productCheckoutRow({
  required String productImage,
  required String productName,
  required String productIngredient,
  required String productPrice,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width20),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(height10),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            productImage,
            height: height10 * 8,
            width: height10 * 8,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: width16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: titleStyle.copyWith(fontSize: titleMedium),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height24 / 2),
              child: Text(
                'With $productIngredient',
                style: subtitleStyle.copyWith(fontSize: height24 / 2),
              ),
            ),
            Text(
              '\$$productPrice',
              style: subtitleStyle.copyWith(fontSize: height08 * 2),
            )
          ],
        )
      ],
    ),
  );
}

Column productList({required List<CartItem> cartItems}) {
  return Column(
    children: cartItems
        .mapIndexed((i, e) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                productCheckoutRow(
                    productImage: e.productImage,
                    productName: e.productName,
                    productIngredient: e.productIngredient,
                    productPrice: e.productPrice.toInt().toString()),
                if (determineIsLast(i, cartItems))
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height24 / 2),
                    child: const Divider(
                      height: 1,
                      color: primaryColor,
                    ),
                  ),
              ],
            ))
        .toList(),
  );
}
