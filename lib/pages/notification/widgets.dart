import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/method.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/models/notification.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String determineIconImage(String notificationType) {
  switch (notificationType) {
    case 'order':
      return 'assets/iconImage/bicycle.png';
    case 'discount':
      return 'assets/iconImage/percentage.png';

    default:
      return 'assets/iconImage/heart_line.png';
  }
}

Row notificationRow({
  required NotificationModel notification,
}) {
  Duration notificationPostDuration =
      DateTime.now().difference(notification.createdAt);
  String durationText;
  if (notificationPostDuration.inSeconds < 60) {
    durationText = '${notificationPostDuration.inSeconds}s';
  } else if (notificationPostDuration.inMinutes < 60) {
    durationText = '${notificationPostDuration.inMinutes}min';
  } else if (notificationPostDuration.inHours < 24) {
    durationText = '${notificationPostDuration.inHours}h';
  } else {
    durationText = '${notificationPostDuration.inDays}d';
  }

  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(height24 / 2),
        decoration: const BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          determineIconImage(notification.type),
          height: height10 * 4,
          width: height10 * 4,
          fit: BoxFit.contain,
        ),
      ),
      SizedBox(
        width: width10,
      ),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.title,
              style: subtitleStyle.copyWith(
                  color: Colors.black,
                  fontFamily: secondaryFontFamily,
                  fontSize: subtitleSmall),
            ),
            SizedBox(
              height: height08,
            ),
            SizedBox(
              height: height10 * 2.2,
              width: width100 * 1.98,
              child: Text(
                notification.body,
                style: descriptionStyle.copyWith(
                    fontFamily: secondaryFontFamily,
                    color: backgroundColor,
                    fontSize: height10 * 0.9),
              ),
            ),
          ],
        ),
      ),
      Text(
        durationText,
        style: subtitleStyle.copyWith(
            fontFamily: secondaryFontFamily,
            fontSize: titleSmall,
            color: const Color(0xFF8D8B8B)),
      )
    ],
  );
}

Column notificationPerDayColumn({
  required DateTime day,
  required List<NotificationModel> notificationToday,
}) {
  String dateFormatted;
  Duration timePastDuration = DateTime.now().difference(day);

  if (timePastDuration.inDays < 2) {
    dateFormatted = 'Yesterday';
  } else if (timePastDuration.inHours < 24) {
    dateFormatted = 'Today';
  } else {
    dateFormatted = DateFormat('dd MMM').format(day);
  }

  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: width20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dateFormatted,
              style: subtitleStyle.copyWith(
                  fontSize: height20,
                  color: const Color(0xFF000000).withOpacity(0.5)),
            ),
            Text(
              'Mark all read',
              style: subtitleStyle.copyWith(
                  fontSize: titleSmall,
                  color: const Color(0xFF000000).withOpacity(0.7)),
            )
          ],
        ),
      ),
      SizedBox(
        height: height08 * 2,
      ),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: notificationToday.length,
        itemBuilder: (context, index) {
          final notification = notificationToday[index];
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width20),
                child: notificationRow(notification: notification),
              ),
              if (!determineIsLast(index, notificationToday))
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height24 / 2),
                  child: Divider(
                    height: 1,
                    color: const Color(0xFFCE9760).withOpacity(0.48),
                  ),
                )
            ],
          );
        },
      )
    ],
  );
}
