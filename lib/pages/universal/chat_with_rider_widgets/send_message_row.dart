import 'dart:io';

import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/favourite/widgets.dart';
import 'package:flutter/material.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';

Row sendMessageRow({
  TextEditingController? messageController,
  void Function()? onTapSend,
  required dynamic Function(File soundFile, String soundName) onTapRecord,
}) {
  return Row(
    children: [
      halfRoundedTextfield(messageController,
          borderColor: backgroundColor,
          borderThickness: 2,
          contentPadding:
              EdgeInsets.symmetric(horizontal: width08, vertical: height08 * 2),
          hintStyle: descriptionStyle.copyWith(
              fontSize: height10 * 0.9,
              color: const Color(0xFF39260B).withOpacity(0.62)),
          hintText: 'Type Message Here...',
          onEditingComplete: onTapSend),
      Container(
        decoration: anotherHalfContainerDecoration(backgroundColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SocialMediaRecorder(
              sendRequestFunction: onTapRecord,
              backGroundColor: backgroundColor,
              recordIcon: Image.asset(
                'assets/iconImage/mic-line.png',
                height: height24,
                fit: BoxFit.fitHeight,
              ),
              recordIconBackGroundColor: backgroundColor,
              sendButtonIcon: Image.asset(
                'assets/iconImage/send-plane-2-line.png',
                height: height24,
                fit: BoxFit.fitHeight,
              ),
              recordIconWhenLockBackGroundColor: backgroundColor,
              recordIconWhenLockedRecord: Image.asset(
                'assets/iconImage/mic-line.png',
                height: height24,
                fit: BoxFit.fitHeight,
              ),
            ),
            GestureDetector(
              onTap: onTapSend,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width08, vertical: height24 / 2),
                child: Image.asset(
                  'assets/iconImage/send-plane-2-line.png',
                  height: height24,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
