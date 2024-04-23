import 'dart:convert';

List<TimelineModel> listTimelinefromJson(String source) =>
    List<TimelineModel>.from(
        jsonDecode(source).map((e) => TimelineModel.fromMap(e)).toList());

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TimelineModel {
  String timelineName;
  String estimatedDate;
  bool isCompleted;
  TimelineModel({
    required this.timelineName,
    required this.estimatedDate,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timeline_name': timelineName,
      'estimated_date': estimatedDate,
      'is_completed': isCompleted,
    };
  }

  factory TimelineModel.fromMap(Map<String, dynamic> map) {
    return TimelineModel(
      timelineName: map['timeline_name'] as String,
      estimatedDate: map['estimated_date'] as String,
      isCompleted: map['is_completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TimelineModel.fromJson(String source) =>
      TimelineModel.fromMap(json.decode(source));
}
