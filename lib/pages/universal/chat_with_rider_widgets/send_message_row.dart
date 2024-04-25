import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/favourite/widgets.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

Row sendMessageRow({
  required RecorderController recorderController,
  TextEditingController? messageController,
  void Function()? onTapSend,
  required Function()? onTapRecord,
  required bool isRecording,
}) {
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: isRecording
            ? AudioWaveforms(
                size: Size(width100 * 2, height10 * 4),
                recorderController: recorderController,
                waveStyle: const WaveStyle(
                  waveColor: Colors.white,
                  extendWaveform: true,
                  showMiddleLine: false,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color(0xFF1E1B26),
                ),
                padding: const EdgeInsets.only(left: 18),
                margin: const EdgeInsets.symmetric(horizontal: 15),
              )
            : halfRoundedTextfield(messageController,
                borderColor: backgroundColor,
                borderThickness: 2,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: width08, vertical: height24 / 2),
                hintStyle: descriptionStyle.copyWith(
                    fontSize: height10 * 0.9,
                    color: const Color(0xFF39260B).withOpacity(0.62)),
                hintText: 'Type Message Here...',
                onEditingComplete: onTapSend),
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: height08 / 2),
          decoration: anotherHalfContainerDecoration(backgroundColor),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onTapRecord,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width08,
                  ),
                  child: isRecording
                      ? Entry.scale(
                          child: Icon(
                            Icons.stop,
                            size: height24,
                            color: textColor,
                          ),
                        )
                      : Entry.scale(
                          child: Image.asset(
                            'assets/iconImage/mic-line.png',
                            height: height24,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
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
        ),
      )
    ],
  );
}
