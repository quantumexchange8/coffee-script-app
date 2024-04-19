import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

IconButton whiteIconButton(String iconAddress,
    {required void Function()? onPressed, Size? size}) {
  return IconButton(
      hoverColor: primaryColor,
      highlightColor: primaryColor.withOpacity(0.5),
      visualDensity: VisualDensity.standard,
      constraints:
          BoxConstraints.tight(size ?? Size(height10 * 4, height10 * 4)),
      onPressed: onPressed,
      style: const ButtonStyle(splashFactory: InkRipple.splashFactory),
      icon: Image.asset(
        iconAddress,
        fit: BoxFit.fitHeight,
      ));
}
