import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';

Widget textChatBubble({required String textChat, required bool isSender}) {
  return Align(
    alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      padding:
          EdgeInsets.symmetric(horizontal: width08, vertical: height24 / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: isSender ? backgroundColor : textColor,
      ),
      child: SizedBox(
        width: width100 * 2,
        child: Text(
          textChat,
          style: descriptionStyle.copyWith(
              fontSize: height10,
              color: isSender ? textColor : backgroundColor),
        ),
      ),
    ),
  );
}

Widget voiceChatBubble({
  void Function()? onTapPlay,
  required bool isSender,
  required PlayerController playerController,
  required int? audioDurationInMilliseconds,
}) {
  String durationString;
  if (audioDurationInMilliseconds != null &&
      !audioDurationInMilliseconds.isNegative) {
    int durationInSecond = audioDurationInMilliseconds ~/ 100;
    durationString =
        '${(durationInSecond / 60).truncate()}:${durationInSecond % 60}';
  } else {
    durationString = '0:00';
  }

  return Align(
    alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      width: width100 * 2.48,
      padding:
          EdgeInsets.symmetric(horizontal: width08, vertical: height24 / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: isSender ? backgroundColor : textColor,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTapPlay,
            child: Container(
              padding: EdgeInsets.all(height08 / 2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
              child: Icon(
                playerController.playerState.isPlaying
                    ? Icons.stop
                    : Icons.play_arrow_rounded,
                color: textColor,
                size: height10 * 1.8,
              ),
            ),
          ),
          Expanded(
            child: AudioFileWaveforms(
              size: Size(width10 * 8.6, height10 * 3.2),
              playerController: playerController,
              enableSeekGesture: true,
              waveformType: WaveformType.long,
              waveformData: const [],
              playerWaveStyle: PlayerWaveStyle(
                  fixedWaveColor:
                      isSender ? Colors.grey.withOpacity(0.4) : Colors.grey,
                  liveWaveColor: primaryColor,
                  spacing: 3,
                  showSeekLine: false,
                  waveThickness: 2),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width08),
            child: Text(
              durationString,
              style: descriptionStyle.copyWith(
                  fontFamily: 'Noto Sans',
                  fontSize: titleSmall,
                  color: isSender ? Colors.grey.withOpacity(0.4) : Colors.grey),
            ),
          ),
          Icon(
            Icons.volume_up,
            color: isSender ? Colors.grey.withOpacity(0.4) : Colors.grey,
            size: height24,
          )
        ],
      ),
    ),
  );
}
