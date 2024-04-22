import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Column orderDescriptionColumn(int itemsCount) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'My Order',
        style: subtitleStyle.copyWith(fontSize: subtitleMedium),
      ),
      SizedBox(
        height: height08,
      ),
      RichText(
        text: TextSpan(
            text: 'You have $itemsCount ',
            style: subtitleStyle.copyWith(
              fontSize: height10 * 1.1,
            ),
            children: [
              TextSpan(
                  text: 'items ',
                  style: subtitleStyle.copyWith(
                      fontSize: height10 * 1.1, color: primaryColor)),
              TextSpan(
                  text: 'in your cart',
                  style: subtitleStyle.copyWith(fontSize: height10 * 1.1)),
            ]),
      ),
    ],
  );
}
