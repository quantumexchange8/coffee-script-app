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

Widget filledButton(
    {required void Function()? onPressed,
    MaterialStateProperty<EdgeInsetsGeometry?>? padding,
    VisualDensity? visualDensity,
    TextStyle? textStyle,
    required String text,
    double? width,
    double? height,
    Color backgroudColor = primaryColor,
    double radius = 10,
    Color? textColor}) {
  return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
          padding: padding,
          minimumSize: MaterialStateProperty.all(const Size(10, 5)),
          visualDensity: visualDensity,
          shape: MaterialStateProperty.all(ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)))),
          fixedSize: MaterialStateProperty.all(
              Size(width ?? width100 * 3.5, height ?? height10 * 6.3)),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => backgroudColor),
          foregroundColor:
              MaterialStateColor.resolveWith((states) => backgroudColor)),
      child: Text(
        text,
        style: textStyle ?? textButtonStyle.copyWith(color: textColor),
      ));
}

Widget outlinedButton(
    {required void Function()? onPressed,
    required String text,
    Color textColor = primaryColor,
    double borderThickness = 3,
    Size? size,
    double radius = 10,
    Color borderColor = primaryColor}) {
  return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
              (states) => primaryColor.withOpacity(0.8)),
          side: MaterialStateBorderSide.resolveWith((states) =>
              BorderSide(width: borderThickness, color: borderColor)),
          shape: MaterialStateProperty.all(ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)))),
          fixedSize: MaterialStateProperty.all(
              size ?? Size(width100 * 3.5, height10 * 6.3)),
          foregroundColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent)),
      child: Text(
        text,
        style: textButtonStyle.copyWith(color: textColor),
      ));
}
