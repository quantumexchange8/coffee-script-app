import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/models/timeline.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
import 'package:coffee_script_app/pages/universal/chat_with_rider_page.dart';
import 'package:coffee_script_app/pages/universal/track_order_widgets/widgets.dart';
import 'package:coffee_script_app/pages/widgets/simple_appbar.dart';
import 'package:flutter/material.dart';

const List<Map<String, dynamic>> _timelineSample = [
  {
    "timeline_name": "Order placed",
    "estimated_date": "2023-03-23 16:36:00",
    "is_completed": true
  },
  {
    "timeline_name": "In Progress",
    "estimated_date": "2023-03-23 16:40:00",
    "is_completed": true
  },
  {
    "timeline_name": "On your way",
    "estimated_date": "2023-03-23 17:10:00",
    "is_completed": false
  },
  {
    "timeline_name": "Delivered",
    "estimated_date": "2023-03-23 17:20:00",
    "is_completed": false
  }
];

class TrackOrderPage extends StatelessWidget {
  final List<TimelineModel>? timelines;
  const TrackOrderPage({super.key, this.timelines});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, title: 'Track Order'),
      backgroundColor: backgroundColor,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: width20, vertical: height24),
        children: [
          trackOrderImage,
          SizedBox(
            height: height08 * 2,
          ),
          estimatedDeliveryTimeRow(
              estimatedTimeOne: '45', estimatedTimeTwo: '55'),
          deliveryTimeline(
              timelineList: timelines ??
                  _timelineSample
                      .map((e) => TimelineModel.fromMap(e))
                      .toList()),
          SizedBox(
            height: height24 / 2,
          ),
          filledButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatWithRiderPage(),
                    ));
              },
              text: 'Chat with Rider')
        ],
      ),
    );
  }
}
