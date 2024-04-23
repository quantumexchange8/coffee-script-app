import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Column successfulColumn({
  required IconData? iconData,
  required String title,
  required String description,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.check_circle_sharp,
        color: primaryColor,
        size: height100 * 1.75,
      ),
      SizedBox(
        height: height31,
      ),
      Text(
        title,
        style: subtitleStyle.copyWith(
          fontSize: height24,
        ),
      ),
      SizedBox(
        height: height08,
      ),
      Text(
        description,
        style: hintStyle.copyWith(
          color: textColor,
        ),
      )
    ],
  );
}
