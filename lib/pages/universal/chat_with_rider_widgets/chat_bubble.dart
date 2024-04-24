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
  required int audioDurationInMilliseconds,
}) {
  int durationInSecond = audioDurationInMilliseconds ~/ 100;

  return Align(
    alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      padding:
          EdgeInsets.symmetric(horizontal: width08, vertical: height24 / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: backgroundColor,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTapPlay,
            child: Container(
              padding: EdgeInsets.all(height08 / 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSender ? backgroundColor : textColor,
              ),
              child: Icon(
                playerController.playerState.isPlaying
                    ? Icons.play_arrow_rounded
                    : Icons.stop,
                color: textColor,
                size: height10 * 1.8,
              ),
            ),
          ),
          AudioFileWaveforms(
            size: Size(width10 * 8.6, height10 * 3.2),
            playerController: playerController,
            enableSeekGesture: true,
            waveformType: WaveformType.long,
            waveformData: const [],
            playerWaveStyle: PlayerWaveStyle(
              fixedWaveColor:
                  isSender ? Colors.grey.withOpacity(0.4) : Colors.grey,
              liveWaveColor: primaryColor,
              spacing: 0.5,
            ),
          ),
          Text(
            '${durationInSecond / 60}:${durationInSecond % 60}',
            style: descriptionStyle.copyWith(
                fontFamily: 'Noto Sans',
                fontSize: titleSmall,
                color: isSender ? Colors.grey.withOpacity(0.4) : Colors.grey),
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
