import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Widget skipButton(void Function() onPressed) => TextButton(
    onPressed: onPressed,
    child: Text(
      'Skip',
      style: titleStyle.copyWith(fontSize: height10 * 1.4),
    ));

Widget filledButton({
  required void Function()? onPressed,
  required String text,
  double? width,
  double? height,
}) {
  return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
          fixedSize: MaterialStateProperty.all(
              Size(width ?? width100 * 3.5, height ?? height10 * 6.3)),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => primaryColor),
          foregroundColor:
              MaterialStateColor.resolveWith((states) => primaryColor)),
      child: Text(
        text,
        style: textButtonStyle,
      ));
}

Widget outlinedButton({
  required void Function()? onPressed,
  required String text,
}) {
  return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
              (states) => primaryColor.withOpacity(0.8)),
          side: MaterialStateBorderSide.resolveWith(
              (states) => const BorderSide(width: 3, color: primaryColor)),
          shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
          fixedSize:
              MaterialStateProperty.all(Size(width100 * 3.5, height10 * 6.3)),
          foregroundColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent)),
      child: Text(
        text,
        style: textButtonStyle.copyWith(color: primaryColor),
      ));
}
