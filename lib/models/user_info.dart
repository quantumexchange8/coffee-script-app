import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserInfo {
  String id;
  String name;
  String? image;
  UserInfo({
    required this.id,
    required this.name,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      id: map['id'].toString(),
      name: map['name'] as String,
      image: map['image'] == null ? null : map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source));
}
