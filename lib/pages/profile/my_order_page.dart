import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/models/order.dart';
import 'package:coffee_script_app/pages/cart/sample_cart_items.dart';
import 'package:coffee_script_app/pages/profile/my_order_widgets/my_order_row.dart';
import 'package:coffee_script_app/pages/universal/track_order_page.dart';
import 'package:coffee_script_app/pages/widgets/outside_appbar.dart';
import 'package:flutter/material.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderList = _sampleOrderList.map((e) => Order.fromMap(e)).toList();

    return Scaffold(
      appBar: outsideAppBar(context, title: 'My Orders'),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: height24),
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          final order = orderList[index];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width20),
                child: myOrderRow(
                    onPressedTrack: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TrackOrderPage(timelines: order.timeline),
                          ));
                    },
                    order: order),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height08),
                child: Divider(
                  height: 1,
                  color: primaryColor.withOpacity(0.22),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

final List<Map<String, dynamic>> _sampleOrderList = [
  {
    "id": 1,
    "cart_items": sampleCartItems1,
    "total_price": "40",
    "status": "In Progress",
    "timeline": [
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
    ]
  },
  {
    "id": 2,
    "cart_items": sampleCartItems2,
    "total_price": "24",
    "status": "In Progress",
    "timeline": [
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
    ]
  },
  {
    "id": 3,
    "cart_items": sampleCartItems3,
    "total_price": "24",
    "status": "Delivered",
    "timeline": [
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
        "is_completed": true
      },
      {
        "timeline_name": "Delivered",
        "estimated_date": "2023-03-23 17:20:00",
        "is_completed": true
      }
    ]
  },
  {
    "id": 4,
    "cart_items": sampleCartItems1,
    "total_price": "40",
    "status": "Delivered",
    "timeline": [
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
        "is_completed": true
      },
      {
        "timeline_name": "Delivered",
        "estimated_date": "2023-03-23 17:20:00",
        "is_completed": true
      }
    ]
  },
  {
    "id": 5,
    "cart_items": sampleCartItems2,
    "total_price": "24",
    "status": "Delivered",
    "timeline": [
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
        "is_completed": true
      },
      {
        "timeline_name": "Delivered",
        "estimated_date": "2023-03-23 17:20:00",
        "is_completed": true
      }
    ]
  },
  {
    "id": 6,
    "cart_items": sampleCartItems3,
    "total_price": "24",
    "status": "Delivered",
    "timeline": [
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
        "is_completed": true
      },
      {
        "timeline_name": "Delivered",
        "estimated_date": "2023-03-23 17:20:00",
        "is_completed": true
      }
    ]
  }
];
