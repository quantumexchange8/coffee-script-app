import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Widget backButton(BuildContext context) => IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    highlightColor: primaryColor.withOpacity(0.5),
    icon: Icon(
      Icons.arrow_back_ios,
      color: primaryColor,
      size: height24,
    ));
