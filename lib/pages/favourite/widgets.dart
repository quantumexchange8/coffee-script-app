import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Container halfRoundedTextfield(
  TextEditingController? controller, {
  EdgeInsetsGeometry? contentPadding,
  String? hintText,
  void Function()? onEditingComplete,
  double borderThickness = 1.0,
  Color borderColor = const Color(0xFF000000),
  TextStyle? hintStyle,
}) {
  return Container(
    padding: EdgeInsets.only(bottom: height05),
    decoration: BoxDecoration(
        color: textColor,
        border: Border(
          left: BorderSide(color: borderColor, width: borderThickness),
          top: BorderSide(color: borderColor, width: borderThickness),
          bottom: BorderSide(color: borderColor, width: borderThickness),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        )),
    child: TextField(
      controller: controller,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
          contentPadding: contentPadding,
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          isDense: true,
          hintText: hintText,
          hintStyle: hintStyle),
    ),
  );
}

BoxDecoration anotherHalfContainerDecoration(Color? fillColor) => BoxDecoration(
    color: fillColor,
    borderRadius: const BorderRadius.only(
      topRight: Radius.circular(10),
      bottomRight: Radius.circular(10),
    ));

Row searchFavouriteRow(
    {TextEditingController? searchController, void Function()? onTapSearch}) {
  return Row(
    children: [
      Expanded(
          flex: 4,
          child: halfRoundedTextfield(searchController,
              borderColor: primaryColor,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: width08, vertical: height08),
              hintText: 'Search Your Favourite Product',
              hintStyle: TextStyle(
                  fontFamily: secondaryFontFamily, fontSize: height24 / 2),
              onEditingComplete: onTapSearch)),
      Expanded(
        child: GestureDetector(
          onTap: onTapSearch,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: height10),
            decoration: anotherHalfContainerDecoration(primaryColor),
            child: Image.asset(
              'assets/iconImage/search-line.png',
              height: height24,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    ],
  );
}
