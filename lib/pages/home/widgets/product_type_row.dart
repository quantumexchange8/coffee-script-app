import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

List<String> productTypes = [
  'Hot Coffees',
  'Ice Teas',
  'Hot Teas',
  'Drinks',
  'Bakery',
];

Widget productTypeRow(int selectedRowIndex,
        {required void Function(int index) onPressedType}) =>
    Row(
      children: productTypes.mapIndexed((i, e) {
        bool isSelected = selectedRowIndex == i;
        return TextButton(
          onPressed: () {
            onPressedType(i);
          },
          child: Text(
            e,
            style: subtitleStyle.copyWith(
                fontSize: height08 * 2,
                color: isSelected ? primaryColor : textColor),
          ),
        );
      }).toList(),
    );
