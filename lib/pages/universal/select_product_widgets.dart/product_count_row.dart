import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Widget countButton({required IconData icon, required void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height31,
      width: height31,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Icon(
          icon,
          size: height15,
        ),
      ),
    ),
  );
}

productCountRow(
    {required void Function()? onTapMinus,
    required void Function()? onTapAdd,
    required int countProduct}) {
  return Row(
    children: [
      countButton(icon: Icons.minimize, onTap: onTapMinus),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: width08),
        child: Text(
          countProduct.toString(),
          style: subtitleStyle.copyWith(fontSize: subtitleSmall),
        ),
      ),
      countButton(icon: Icons.add, onTap: onTapAdd)
    ],
  );
}
