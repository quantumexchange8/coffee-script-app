import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Column profileImageColumn({
  String? userImage,
  required String userName,
}) {
  bool noImage = userImage == null;

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        height: height10 * 8.2,
        width: height10 * 8.2,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: noImage ? textColor : null,
                  image: noImage
                      ? null
                      : DecorationImage(
                          image: NetworkImage(userImage), fit: BoxFit.cover)),
              child: noImage
                  ? Icon(
                      Icons.person,
                      color: Colors.black,
                      size: height24,
                    )
                  : null,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(height08 / 2),
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: textColor,
                  ),
                ),
                child: Image.asset(
                  'assets/iconImage/pencil.png',
                  fit: BoxFit.fitHeight,
                  height: height24 / 2,
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: height08 * 2,
      ),
      Text(
        userName,
        style: subtitleStyle.copyWith(fontSize: subtitleMedium),
      )
    ],
  );
}
