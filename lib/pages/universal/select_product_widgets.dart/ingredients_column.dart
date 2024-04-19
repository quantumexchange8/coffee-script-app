import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Container _roundedCircle = Container(
  height: height24 / 2,
  width: height24 / 2,
  decoration: const BoxDecoration(color: primaryColor, shape: BoxShape.circle),
);

Column ingredientIconColumn() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        height: height10 * 5.2,
        width: height10 * 5.2,
        decoration:
            const BoxDecoration(color: primaryColor, shape: BoxShape.circle),
        child: Center(
            child: Image.asset(
          'assets/iconImage/milk.png',
          height: height31,
          fit: BoxFit.fitHeight,
        )),
      ),
      SizedBox(
        height: height15,
      ),
      Text(
        'Milk',
        style: subtitleStyle.copyWith(fontSize: height08 * 2),
      )
    ],
  );
}

Row ingredientsRow() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _roundedCircle,
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/iconImage/ingredients_arc.png',
              width: width100 * 3.11,
              fit: BoxFit.fitWidth,
            ),
            ingredientIconColumn()
          ],
        ),
        _roundedCircle
      ],
    );

Column ingredientsColumn() {
  return Column(
    children: [
      Text(
        'ingredients',
        style: titleStyle.copyWith(fontSize: titleMedium),
      ),
      SizedBox(
        height: height15,
      ),
      ingredientsRow(),
    ],
  );
}
