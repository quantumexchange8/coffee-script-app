import 'dart:convert';

List<NotificationModel> listNotificationfromJson(String source) =>
    List<NotificationModel>.from(
        jsonDecode(source).map((e) => NotificationModel.fromMap(e)).toList());

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotificationModel {
  int id;
  String title;
  String body;
  String type;
  DateTime createdAt;
  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "title": title,
      "body": body,
      "type": type,
      "created_at": createdAt,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
      type: map['type'] as String,
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source));
}
