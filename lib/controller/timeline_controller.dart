import 'package:coffee_script_app/models/timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TimelineController extends GetxController {
  static TimelineController instance = Get.find();

  Future<List<TimelineModel>?> getTimelineList() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummyData/timeline.json');
      return listTimelinefromJson(response);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
