import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/widgets/appbar_title.dart';
import 'package:coffee_script_app/pages/widgets/back_button.dart';
import 'package:flutter/material.dart';

AppBar outsideAppBar(BuildContext context,
        {bool centerTitle = true,
        Widget? titleWidget,
        required String title,
        List<Widget>? actions}) =>
    AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      leading: backButton(context),
      title: titleWidget ?? appbarTitle(title),
      actions: actions,
      toolbarHeight: height100,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
