import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

OutlineInputBorder _normalBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide.none,
);

Column cardDetailsTextfieldColumn({
  required String textLabel,
  TextEditingController? controller,
  String? hintText,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        textLabel,
        style: hintStyle.copyWith(
          color: textColor,
          fontSize: height08 * 2,
        ),
      ),
      SizedBox(
        height: height08,
      ),
      TextFormField(
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: hintStyle,
          filled: true,
          fillColor: textColor,
          border: _normalBorder,
          enabledBorder: _normalBorder,
          errorBorder: _normalBorder.copyWith(
              borderSide: const BorderSide(color: Colors.redAccent)),
          focusedBorder: _normalBorder.copyWith(
              borderSide: const BorderSide(color: primaryColor)),
          focusedErrorBorder: _normalBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red)),
        ),
      )
    ],
  );
}
