import 'package:coffee_script_app/pages/widgets/appbar_title.dart';
import 'package:coffee_script_app/pages/widgets/back_button.dart';
import 'package:flutter/material.dart';

AppBar simpleAppBar(BuildContext context,
        {required String title,
        List<Widget>? actions,
        void Function()? onPressedBack}) =>
    AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: backButton(context, onPressedBack: onPressedBack),
      title: appbarTitle(title),
      actions: actions,
    );
