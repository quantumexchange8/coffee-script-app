import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/helper/icons.dart';
import 'package:coffee_script_app/pages/universal/select_product_methods.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Widget productSizeContainer({
  void Function()? onTap,
  required bool picked,
  required double containerSize,
  required double iconSize,
  required String sizeName,
}) =>
    Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: containerSize,
            width: containerSize,
            padding: EdgeInsets.all(height08),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(10)),
            child: Icon(
              CoffeeScriptIcons.drinks_line,
              color: picked ? textColor : backgroundColor,
              size: iconSize,
            ),
          ),
        ),
        SizedBox(
          height: height10,
        ),
        Text(
          sizeName,
          style: titleStyle.copyWith(
              fontSize: height10 * 1.4,
              color: picked ? textColor : primaryColor),
        )
      ],
    );

Column productSizeColumn({
  required String selectedProductType,
  required int selectedCoffeeSizeIndex,
  required void Function(int index) onTapProductSize,
}) {
  String coreProductName = determineCoreProduct(selectedProductType);

  return Column(children: [
    Text(
      '$coreProductName Size',
      textAlign: TextAlign.center,
      style: titleStyle.copyWith(fontSize: titleMedium),
    ),
    SizedBox(
      height: height08 * 2,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: drinkSize
          .mapIndexed((i, e) => Padding(
                padding: EdgeInsets.only(
                    right: (i != drinkSize.length - 1) ? width16 : 0),
                child: productSizeContainer(
                    onTap: () {
                      onTapProductSize(i);
                    },
                    containerSize: e['container_size'],
                    picked: selectedCoffeeSizeIndex == i,
                    iconSize: e['icon_size'],
                    sizeName: e['size_name']),
              ))
          .toList(),
    ),
  ]);
}

List<Map<String, dynamic>> drinkSize = [
  {
    'icon_size': height10 * 3.8,
    'size_name': 'Small',
    'container_size': height10 * 6.6
  },
  {
    'icon_size': height10 * 5.9,
    'size_name': 'Medium',
    'container_size': height10 * 9.4
  },
  {
    'icon_size': height10 * 8.3,
    'size_name': 'Large',
    'container_size': height100 * 1.22
  },
];
