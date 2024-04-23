import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Row saveCardRow({
  required bool? checkboxValue,
  required void Function(bool? value)? onChangedCheckbox,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Checkbox(
        value: checkboxValue,
        onChanged: onChangedCheckbox,
        checkColor: backgroundColor,
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected) ||
              states.contains(MaterialState.pressed)) {
            return primaryColor;
          } else {
            return textColor;
          }
        }),
        focusColor: primaryColor.withOpacity(0.3),
        visualDensity: VisualDensity.compact,
      ),
      SizedBox(
        width: width08,
      ),
      Text(
        'Save Card',
        style: hintStyle.copyWith(
          color: textColor,
        ),
      )
    ],
  );
}
