import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

const primaryFontFamily = 'Poppins';
const secondaryFontFamily = 'Inter';
final titleLarge = height10 * 3.6;
final titleMedium = height10 * 2.2;
final titleSmall = height10 * 1.4;

final subtitleLarge = height24;
final subtitleMedium = height10 * 2.2;
final subtitleSmall = height10 * 1.8;

const title = TextStyle(
    fontFamily: primaryFontFamily,
    fontWeight: FontWeight.w700,
    color: textColor);

const subtitle = TextStyle(
    fontFamily: primaryFontFamily,
    fontWeight: FontWeight.w600,
    color: textColor);

final textButton = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: height20,
    fontWeight: FontWeight.w700,
    color: backgroundColor);

final descriptionText = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: height10 * 1.4,
    color: backgroundColor);

final hintStyle = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: height10 * 1.4,
    fontWeight: FontWeight.w500,
    color: backgroundColor.withOpacity(0.5));

final moneyTag = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: height10 * 1.6,
    fontWeight: FontWeight.w600,
    color: descriptionColor);
