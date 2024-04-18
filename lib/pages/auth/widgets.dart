import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/helper/icons.dart';
import 'package:flutter/material.dart';

const BoxDecoration backgroundDecoration = BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/backgroundPicture/auth_background.png'),
        fit: BoxFit.cover));

final Icon logoCoffeeScript = Icon(
  CoffeeScriptIcons.logo,
  size: height10 * 4.4,
  color: primaryColor,
);

Text titleAuthPage(String text) => Text(
      text,
      style: subtitleStyle.copyWith(fontSize: subtitleLarge),
    );

final OutlineInputBorder authBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.circular(10),
);

TextFormField darkTextfield(
    {required TextEditingController controller, String? hintText}) {
  return TextFormField(
    controller: controller,
    maxLines: 1,
    autocorrect: false,
    style: authHintStyle.copyWith(color: textColor),
    decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(height20),
        hintText: hintText,
        hintStyle: authHintStyle,
        border: authBorder,
        enabledBorder: authBorder,
        disabledBorder: authBorder,
        errorBorder: authBorder.copyWith(
            borderSide: const BorderSide(color: Colors.redAccent)),
        focusedBorder:
            authBorder.copyWith(borderSide: const BorderSide(color: textColor)),
        focusedErrorBorder: authBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red)),
        filled: true,
        fillColor: const Color(0xFF16181C).withOpacity(0.7)),
  );
}

Container thirdPartyLogo(String iconAddress, {int? cacheHeight}) {
  return Container(
    height: height10 * 6.4,
    width: width10 * 9.8,
    decoration: BoxDecoration(
        color: const Color(0xFF101215).withOpacity(0.7),
        borderRadius: BorderRadius.circular(10)),
    child: Center(
        child: Image.asset(iconAddress,
            fit: BoxFit.fitHeight,
            cacheHeight: cacheHeight ?? (height24).toInt())),
  );
}

Row orDivider(String text) {
  const Divider divider = Divider(
    thickness: 2,
    color: Color(0xFFDD9854),
  );

  return Row(
    children: [
      const Expanded(child: divider),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: width10),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: subtitleStyle.copyWith(fontSize: height08 * 2),
        ),
      ),
      const Expanded(child: divider),
    ],
  );
}

Row changeAuthPageText({
  required String firstText,
  required void Function() onPressedButton,
  required String buttonText,
}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        firstText,
        style: subtitleStyle.copyWith(fontSize: height08 * 2),
      ),
      customTextButton(
          onPressedButton: onPressedButton,
          buttonText: buttonText,
          fontSize: height08 * 2)
    ],
  );
}

TextButton customTextButton(
    {required void Function() onPressedButton,
    required String buttonText,
    required double fontSize}) {
  return TextButton(
    style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
            (states) => primaryColor.withOpacity(0.8))),
    onPressed: onPressedButton,
    child: Text(
      buttonText,
      style: titleStyle.copyWith(fontSize: fontSize, color: primaryColor),
    ),
  );
}
