import 'package:coffee_script_app/helper/constant/method.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/models/notification.dart';
import 'package:coffee_script_app/pages/notification/widgets.dart';
import 'package:coffee_script_app/pages/widgets/outside_appbar.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notificationList =
      _notificationsSample.map((e) => NotificationModel.fromMap(e)).toList();

  @override
  Widget build(BuildContext context) {
    final Map<DateTime, List<NotificationModel>> notificationByDay =
        getDayGroupedNotification(rangeDateNotification: notificationList);

    return Scaffold(
      appBar: outsideAppBar(context, title: 'Notification'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: height24),
        children: notificationByDay.keys
            .mapIndexed((i, key) => Padding(
                  padding: EdgeInsets.only(
                      bottom:
                          determineIsLast(i, notificationByDay.keys.toList())
                              ? 0
                              : height30),
                  child: notificationPerDayColumn(
                      day: key, notificationToday: notificationByDay[key]!),
                ))
            .toList(),
      ),
    );
  }
}

const List<Map<String, dynamic>> _notificationsSample = [
  {
    "id": 1001,
    "title": "Order Delivered",
    "body": "Lorem ipsum dolor sit amet consectetur. Scelerisque",
    "type": "order",
    "created_at": "2024-04-23 14:40:00"
  },
  {
    "id": 1002,
    "title": "20% discount Alert",
    "body": "Lorem ipsum dolor sit amet consectetur. Scelerisque",
    "type": "discount",
    "created_at": "2024-04-23 13:40:00"
  },
  {
    "id": 1003,
    "title": "New Product launch",
    "body": "Lorem ipsum dolor sit amet consectetur. Scelerisque",
    "type": "new product",
    "created_at": "2024-04-22 15:00:00"
  },
  {
    "id": 1004,
    "title": "Order Delivered",
    "body": "Lorem ipsum dolor sit amet consectetur. Scelerisque",
    "type": "order",
    "created_at": "2024-04-22 09:40:00"
  },
  {
    "id": 1005,
    "title": "20% discount Alert",
    "body": "Lorem ipsum dolor sit amet consectetur. Scelerisque",
    "type": "discount",
    "created_at": "2024-04-22 08:40:00"
  },
  {
    "id": 1006,
    "title": "New Product launch",
    "body": "Lorem ipsum dolor sit amet consectetur. Scelerisque",
    "type": "new product",
    "created_at": "2024-04-22 12:00:00"
  }
];
