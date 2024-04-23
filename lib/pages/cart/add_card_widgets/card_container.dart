import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Widget visaLogo = SizedBox(
  height: height10 * 2.8,
  width: width10 * 4.5,
  child: Stack(
    children: [
      Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: height10 * 2.8,
          width: height10 * 2.8,
          decoration: BoxDecoration(
              color: const Color(0xFFF8CB2E).withOpacity(0.8),
              shape: BoxShape.circle),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: height10 * 2.8,
          width: height10 * 2.8,
          decoration: const BoxDecoration(
              color: Color(0xFFE33A24), shape: BoxShape.circle),
        ),
      ),
    ],
  ),
);

Column cardDetailColumn({
  required String key,
  required String value,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        key,
        style: descriptionStyle.copyWith(
            fontFamily: 'Plus Jakarta Sans',
            color: textColor,
            fontSize: height24 / 2),
      ),
      SizedBox(
        height: height08,
      ),
      Text(
        value,
        style: titleStyle.copyWith(
            fontFamily: 'Plus Jakarta Sans', fontSize: titleSmall),
      )
    ],
  );
}

Container cardContainer({
  required String cardNumber,
  required String cardHolderName,
  required String expiredDate,
}) {
  return Container(
    height: height100 * 2.18,
    padding: EdgeInsets.only(left: height20),
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: width08),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: height100 * 1.5,
              width: height100 * 1.5,
              decoration: const BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                  )),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height20,
            ),
            Padding(
              padding: EdgeInsets.only(right: width20 * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Allied Supreme Bank',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: height08 * 2,
                      color: backgroundColor,
                    ),
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/iconImage/Vector1.png',
                        fit: BoxFit.fitHeight,
                        height: height24,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          'assets/iconImage/Vector2.png',
                          fit: BoxFit.fitHeight,
                          height: height24 / 2,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height31),
              child: Text(
                cardNumber,
                style: titleStyle.copyWith(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: height24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cardDetailColumn(
                      key: 'Card Holder Name', value: cardHolderName),
                  cardDetailColumn(key: 'Expired Date', value: expiredDate),
                  visaLogo
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}
