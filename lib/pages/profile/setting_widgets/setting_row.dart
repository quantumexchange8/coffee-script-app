import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/profile/profile_widget/profile_navigation_row.dart';
import 'package:flutter/material.dart';

Widget settingRow(BuildContext context,
    {required dynamic iconAddress,
    required String navigationName,
    Widget? nextPage}) {
  return profileNavigationRow(
    context,
    iconAddress: iconAddress,
    navigationName: navigationName,
    iconPadding: EdgeInsets.all(height24 / 2),
    iconSize: height10 * 4,
    textStyle: subtitleStyle.copyWith(
        fontFamily: secondaryFontFamily,
        fontSize: height10 * 1.8,
        color: Colors.black),
    nextPage: nextPage,
  );
}
