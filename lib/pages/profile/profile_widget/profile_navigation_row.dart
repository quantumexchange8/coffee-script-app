import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Widget profileNavigationRow(
  BuildContext context, {
  void Function()? onTap,
  Widget? nextPage,
  required iconAddress,
  required String navigationName,
  double? iconSize,
  EdgeInsetsGeometry? iconPadding,
  TextStyle? textStyle,
}) {
  return GestureDetector(
    onTap: () {
      if (nextPage != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => nextPage,
            ));
      }
      if (onTap != null) {
        onTap();
      }
    },
    child: Row(
      children: [
        Container(
          padding: iconPadding ?? EdgeInsets.all(height24 / 2),
          decoration: const BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
          child: iconAddress is IconData
              ? Icon(
                  iconAddress,
                  size: iconSize ?? height10 * 4,
                  color: textColor,
                )
              : Image.asset(
                  iconAddress,
                  fit: BoxFit.fitHeight,
                  height: iconSize ?? height24,
                ),
        ),
        SizedBox(
          width: width20,
        ),
        Expanded(
          child: Text(
            navigationName,
            style: textStyle ??
                hintStyle.copyWith(color: textColor, fontSize: height08 * 2),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: primaryColor,
          size: height20,
        )
      ],
    ),
  );
}
