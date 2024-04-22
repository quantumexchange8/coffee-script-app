import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Container semiSphericalContainer(Widget? child) => Container(
      padding: EdgeInsets.symmetric(horizontal: width24),
      height: height100 * 6,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(width100 * 5, height100 * 1.2),
            topRight: Radius.elliptical(width100 * 5, height100 * 1.2)),
      ),
      child: child,
    );
