import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Column promotionTextColumn = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Get 20% Discount\nOn your First Order!',
      style: subtitleStyle.copyWith(fontSize: subtitleSmall),
    ),
    SizedBox(
      height: height08 * 2,
    ),
    Text(
      'Lorem ipsum dolor sit amet consectetur.\nVestibulum eget blandit mattis',
      style:
          descriptionStyle.copyWith(color: textColor, fontSize: height10 * 0.9),
    )
  ],
);

Image promotionImage = Image.asset(
  'assets/images/promo.png',
  width: height100 * 1.6,
  height: height100 * 1.2,
  fit: BoxFit.cover,
);

Container promotionContainer = Container(
  padding: EdgeInsets.symmetric(vertical: height20, horizontal: width10 / 2),
  decoration: BoxDecoration(
    color: primaryColor.withOpacity(0.49),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Row(
    children: [
      SizedBox(
        width: width08,
      ),
      promotionTextColumn,
      SizedBox(
        width: width10 / 2,
      ),
      promotionImage
    ],
  ),
);
