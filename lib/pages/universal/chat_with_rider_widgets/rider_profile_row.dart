import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

Row riderProfileRow({
  required String riderImage,
  required String riderName,
  required bool isOnline,
}) {
  return Row(
    children: [
      Container(
        height: height10 * 5.8,
        width: height10 * 5.8,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(riderImage), fit: BoxFit.cover)),
      ),
      SizedBox(
        width: width08,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            riderName,
            style: subtitleStyle.copyWith(fontSize: subtitleSmall),
          ),
          Entry.offset(
            yOffset: 50,
            visible: isOnline,
            child: Text(
              'Online',
              style: hintStyle.copyWith(
                  fontSize: height10 * 0.9, color: textColor),
            ),
          )
        ],
      )
    ],
  );
}
