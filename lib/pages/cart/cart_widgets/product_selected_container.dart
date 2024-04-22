import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/helper/icons.dart';
import 'package:coffee_script_app/pages/universal/select_product_widgets/product_count_row.dart';
import 'package:flutter/material.dart';
import 'package:slideable/Slideable.dart';

Column productSelectedDetailColumn({
  required String productName,
  required String productIngredients,
  required String productPrice,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        productName,
        style: titleStyle.copyWith(fontSize: height08 * 2),
      ),
      Text('With $productIngredients',
          style: subtitleStyle.copyWith(fontSize: height10)),
      Text('\$ $productPrice',
          style: subtitleStyle.copyWith(fontSize: height10 * 1.4)),
    ],
  );
}

Row _productCountRow({
  required void Function()? onTapMinus,
  required int countNumber,
  required void Function()? onTapAdd,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      countButton(
          icon: Icons.minimize,
          onTap: onTapMinus,
          buttonColor: backgroundColor,
          iconColor: textColor),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: width10),
        child: Text(
          countNumber.toString(),
          style: subtitleStyle.copyWith(
            fontSize: height08 * 2,
          ),
        ),
      ),
      countButton(
          icon: Icons.add,
          onTap: onTapAdd,
          buttonColor: backgroundColor,
          iconColor: textColor),
    ],
  );
}

Widget productSelectedContainer({
  required String productImage,
  required String productName,
  required String productIngredients,
  required String productPrice,
  required int productCount,
  required void Function()? onTapMinus,
  required void Function()? onTapAdd,
  required void Function() onTapDelete,
}) {
  return Slideable(
    items: [
      ActionItems(
        icon: Icon(
          CoffeeScriptIcons.delete_bin_line,
          color: textColor,
          size: height30,
        ),
        onPress: onTapDelete,
        backgroudColor: Colors.transparent,
      ),
    ],
    child: Container(
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(
        horizontal: width10,
        vertical: height08 * 2,
      ),
      child: Row(
        children: [
          Image.asset(
            productImage,
            width: width10 * 7.6,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            width: width08 * 2,
          ),
          productSelectedDetailColumn(
              productName: productName,
              productIngredients: productIngredients,
              productPrice: productPrice),
          SizedBox(
            width: width100,
          ),
          _productCountRow(
              onTapMinus: onTapMinus,
              countNumber: productCount,
              onTapAdd: onTapAdd)
        ],
      ),
    ),
  );
}
