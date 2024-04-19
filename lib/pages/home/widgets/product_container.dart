import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/widgets/like_button.dart';
import 'package:flutter/material.dart';

Image productPicture(String imageAddress) => Image.asset(
      imageAddress,
      fit: BoxFit.cover,
      height: height100,
      width: width100 * 1.15,
    );

Column productDetailColumn(
    {required String productName,
    required String productPrice,
    required String productDescription}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            productName,
            style: subtitleStyle.copyWith(fontSize: subtitleSmall),
          ),
          Text(
            '\$$productPrice',
            style: subtitleStyle.copyWith(
                color: descriptionColor, fontSize: height08 * 2),
          )
        ],
      ),
      SizedBox(
        height: height05,
      ),
      Text(
        productDescription,
        style: descriptionStyle.copyWith(
            color: descriptionColor, fontSize: height10 * 0.9),
      )
    ],
  );
}

Container productContainer({
  Future<bool?> Function(bool liked)? onTapFavourite,
  required String productImage,
  required String productName,
  required String productPrice,
  required String productDescription,
  required bool isFavourite,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: width10 * 0.9),
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(7),
    ),
    child: Column(
      children: [
        SizedBox(
          height: height08,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            productPicture(productImage),
            likeButton(
              isFavourite: isFavourite,
              onTapFavourite: onTapFavourite,
            )
          ],
        ),
        productDetailColumn(
            productName: productName,
            productPrice: productPrice,
            productDescription: productDescription)
      ],
    ),
  );
}
