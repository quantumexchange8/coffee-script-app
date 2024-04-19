import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/widgets/white_icon_button.dart';
import 'package:flutter/material.dart';

Container userImageContainer(String url) => Container(
      height: height30 * 2,
      width: height30 * 2,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(image: NetworkImage(url), fit: BoxFit.fitHeight)),
    );

Column userNameColumn(String userName) {
  DateTime currentTime = DateTime.now();
  String greetingSpeech;

  if (currentTime.hour < 12) {
    greetingSpeech = 'Good Morning!';
  } else {
    greetingSpeech = 'Good Afternoon!';
  }

  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        userName,
        style: subtitleStyle.copyWith(fontSize: subtitleMedium),
      ),
      SizedBox(
        height: height08,
      ),
      Text(
        greetingSpeech,
        style: subtitleStyle.copyWith(
            fontWeight: FontWeight.w300, fontSize: subtitleSmall),
      ),
    ],
  );
}

Row userNameRow({
  required String userImageUrl,
  required String userName,
  required void Function()? onPressedSearch,
  required void Function()? onPressedNotification,
}) {
  return Row(
    children: [
      userImageContainer(userImageUrl),
      SizedBox(
        width: width10,
      ),
      Expanded(child: userNameColumn(userName)),
      whiteIconButton('assets/iconImage/search-line-white.png',
          onPressed: onPressedSearch),
      whiteIconButton('assets/iconImage/notification-4-line-white.png',
          onPressed: onPressedNotification)
    ],
  );
}
