import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Row searchFavouriteRow(
    {TextEditingController? searchController, void Function()? onTapSearch}) {
  return Row(
    children: [
      Expanded(
        flex: 4,
        child: Container(
          padding: EdgeInsets.only(bottom: height05),
          decoration: const BoxDecoration(
              color: textColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
          child: TextField(
            controller: searchController,
            onEditingComplete: onTapSearch,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: width08, vertical: height08),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                isDense: true,
                hintText: 'Search Your Favourite Product',
                hintStyle: TextStyle(
                    fontFamily: secondaryFontFamily, fontSize: height24 / 2)),
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: onTapSearch,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: height10),
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
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
