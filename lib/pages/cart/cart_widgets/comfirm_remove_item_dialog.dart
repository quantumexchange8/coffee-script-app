import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
import 'package:flutter/material.dart';

Dialog comfirmRemoveItemDialog(BuildContext context) {
  return Dialog(
    insetPadding: EdgeInsets.symmetric(horizontal: width20),
    backgroundColor: primaryColor,
    shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.zero),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: height24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Remove from Cart?',
            style: subtitleStyle.copyWith(fontSize: subtitleSmall),
          ),
          SizedBox(
            height: height08,
          ),
          Text(
            'Lorem ipsum dolor sit amet consectetur. Vestibulum eget\nblandit mattis ',
            textAlign: TextAlign.center,
            style: descriptionStyle.copyWith(
                color: descriptionColor, fontSize: height10),
          ),
          SizedBox(
            height: height31,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              filledButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  height: height10 * 4.5,
                  width: width10 * 7.9,
                  backgroudColor: backgroundColor,
                  textColor: textColor,
                  radius: 0,
                  text: 'Yes'),
              SizedBox(
                width: width24,
              ),
              outlinedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  size: Size(width10 * 7.9, height10 * 4.5),
                  textColor: backgroundColor,
                  borderThickness: 1.5,
                  borderColor: backgroundColor,
                  radius: 0,
                  text: 'No')
            ],
          )
        ],
      ),
    ),
  );
}
