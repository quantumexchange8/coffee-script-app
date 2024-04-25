import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
import 'package:flutter/material.dart';

Column checkoutDetailColumn({
  required void Function()? onTapAddCard,
  required String title,
  required iconAddress,
  required String subtitle,
  required String description,
  required String buttonText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: hintStyle.copyWith(color: textColor, fontSize: height20),
      ),
      SizedBox(
        height: height08 * 2,
      ),
      Row(
        children: [
          GestureDetector(
            onTap: onTapAddCard,
            child: Container(
                padding: EdgeInsets.all(height24 / 2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: iconAddress is IconData
                    ? Icon(
                        iconAddress,
                        color: descriptionColor,
                        size: height24,
                      )
                    : Image.asset(
                        iconAddress,
                        fit: BoxFit.fitHeight,
                        height: height24,
                      )),
          ),
          SizedBox(
            width: width08 * 2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: subtitleStyle.copyWith(fontSize: subtitleSmall),
                ),
                SizedBox(
                  height: height08,
                ),
                Text(
                  description,
                  style: descriptionStyle.copyWith(
                      color: textColor, fontSize: height24 / 2),
                )
              ],
            ),
          ),
          filledButton(
              onPressed: onTapAddCard,
              visualDensity: VisualDensity.compact,
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              textStyle:
                  hintStyle.copyWith(color: Colors.black, fontSize: height08),
              height: height10 * 2.1,
              width: width10 * 5.4,
              radius: 100,
              text: buttonText)
        ],
      )
    ],
  );
}
