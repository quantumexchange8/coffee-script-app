import 'package:coffee_script_app/models/notification.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future pushReplacement(BuildContext context,
    {required Widget nextPage, Offset? begin}) async {
  return await Navigator.pushReplacement(context, PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return SlideTransition(
          position: animation.drive(
              Tween(begin: begin ?? const Offset(1.0, 0), end: Offset.zero)
                  .chain(
            CurveTween(curve: Curves.linear),
          )),
          child: nextPage);
    },
  ));
}

bool changeBoolString(String boolString) {
  return boolString == 'true' ? true : false;
}

Map<DateTime, List<NotificationModel>> getDayGroupedNotification(
    {required List<NotificationModel> rangeDateNotification}) {
  // Group the transactions by their dates
  final groupedNotifications = groupBy(rangeDateNotification, (notification) {
    final createdAt = notification.createdAt;
    return DateTime(createdAt.year, createdAt.month, createdAt.day);
  });
  return groupedNotifications;
}

bool determineIsLast(int index, List list) {
  return index == (list.length - 1);
}
