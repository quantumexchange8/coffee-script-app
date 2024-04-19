import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:flutter/material.dart';

Text appbarTitle(String title) => Text(
      title,
      style: titleStyle.copyWith(fontSize: titleMedium),
    );
