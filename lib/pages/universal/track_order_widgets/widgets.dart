import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/helper/icons.dart';
import 'package:coffee_script_app/models/timeline.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';

Image trackOrderImage = Image.asset(
  'assets/images/delivery.png',
  fit: BoxFit.contain,
  height: height100 * 2.5,
  width: width100 * 3,
);

Row estimatedDeliveryTimeRow({
  required String estimatedTimeOne,
  required String estimatedTimeTwo,
}) {
  return Row(
    children: [
      Container(
          padding: EdgeInsets.fromLTRB(height20, height08, height20, height20),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: primaryColor),
          child: Icon(
            CoffeeScriptIcons.time_line,
            size: height10 * 3.7,
            color: textColor,
          )),
      SizedBox(
        width: width08 * 2,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estimated Delivery Time',
            style: hintStyle.copyWith(color: textColor, fontSize: height20),
          ),
          SizedBox(
            height: height08,
          ),
          Text(
            '$estimatedTimeOne - $estimatedTimeTwo min',
            style: titleStyle.copyWith(color: primaryColor, fontSize: height20),
          )
        ],
      )
    ],
  );
}

Column endChild({required String title, required String description}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        title,
        style: hintStyle.copyWith(
          color: textColor,
          fontSize: height08 * 2,
        ),
      ),
      SizedBox(
        height: height05,
      ),
      Text(
        description,
        style: TextStyle(
          fontFamily: primaryFontFamily,
          fontWeight: FontWeight.w300,
          fontSize: height10,
          color: textColor,
        ),
      ),
    ],
  );
}

Column deliveryTimeline({
  required List<TimelineModel> timelineList,
}) {
  return Column(
    children: timelineList
        .mapIndexed((i, e) => SizedBox(
              height: height10 * 7.5,
              child: TimelineTile(
                  alignment: TimelineAlign.manual,
                  isFirst: i == 0,
                  lineXY: 0.4,
                  isLast: i == (timelineList.length - 1),
                  afterLineStyle:
                      const LineStyle(color: primaryColor, thickness: 3),
                  beforeLineStyle:
                      const LineStyle(color: primaryColor, thickness: 3),
                  indicatorStyle: IndicatorStyle(
                    indicator: e.isCompleted
                        ? null
                        : Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: backgroundColor,
                                border:
                                    Border.all(color: primaryColor, width: 2)),
                            child: const Icon(
                              Icons.check,
                              color: primaryColor,
                            ),
                          ),
                    padding: EdgeInsets.symmetric(
                      horizontal: width24 / 2,
                    ),
                    iconStyle: IconStyle(
                        iconData: Icons.check, color: backgroundColor),
                    color: primaryColor,
                    height: height10 * 3.7,
                    width: height10 * 3.7,
                  ),
                  endChild: endChild(
                      title: e.timelineName,
                      description: DateFormat('dd MMMM yyyy,HH:mm a')
                          .format(DateTime.parse(e.estimatedDate)))),
            ))
        .toList(),
  );
}
