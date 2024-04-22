import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
import 'package:flutter/material.dart';

addToCartRow(
    {required double totalAmount,
    required void Function()? onPressedAddToCart}) {
  return Row(
    children: [
      Text(
        '\$ ${totalAmount.toInt()}',
        style: subtitleStyle.copyWith(fontSize: subtitleMedium),
      ),
      SizedBox(
        width: width08 * 2,
      ),
      filledButton(
          width: width100 * 2.7,
          height: height10 * 5.9,
          onPressed: onPressedAddToCart,
          text: 'Add to cart')
    ],
  );
}
