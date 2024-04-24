import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/models/order.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
import 'package:flutter/material.dart';

Row myOrderRow({
  required Order order,
}) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(height08),
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          order.cartItems.first.product.productImage,
          fit: BoxFit.cover,
          height: height20 * 4,
          width: height20 * 4,
        ),
      ),
      SizedBox(
        width: width24 / 2,
      ),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.cartItems.first.product.productName,
              style: subtitleStyle.copyWith(
                  fontFamily: secondaryFontFamily,
                  fontSize: height10 * 1.8,
                  color: backgroundColor),
            ),
            Text(
              'Qty: ${order.cartItems.first.productCount}',
              style: hintStyle.copyWith(
                  fontFamily: secondaryFontFamily,
                  fontSize: height24 / 2,
                  color: const Color(0xFF000000).withOpacity(0.49)),
            ),
            Text(
              '\$${order.totalPrice.toInt()}',
              style: subtitleStyle.copyWith(
                  fontFamily: secondaryFontFamily,
                  fontSize: height08 * 2,
                  color: backgroundColor),
            ),
            Text(
              order.status,
              style: hintStyle.copyWith(
                  fontFamily: secondaryFontFamily,
                  fontSize: height24 / 2,
                  color: const Color(0xFF000000).withOpacity(0.49)),
            )
          ],
        ),
      ),
      order.status.toLowerCase() == 'delivered'
          ? outlinedButton(
              onPressed: () {},
              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              borderThickness: 1,
              size: Size(width10 * 8.6, height10 * 2.9),
              textStyle: subtitleStyle.copyWith(
                  fontSize: height10 * 1.1, color: primaryColor),
              text: 'Complete')
          : filledButton(
              onPressed: () {},
              textStyle: subtitleStyle.copyWith(
                fontSize: height10 * 1.1,
              ),
              visualDensity: VisualDensity.compact,
              height: height10 * 2.9,
              width: width10 * 8.6,
              text: 'Track')
    ],
  );
}
