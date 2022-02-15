import 'dart:io';

import 'package:intl/intl.dart';

class ZendeskFlutterArticle {
  late num id;
  late num parentId;
  late String title;
  late String category;
  late String section;
  late String content;
  late DateTime? updatedAt;

  ZendeskFlutterArticle.fromMap(Map map) {
    id = map['id'];
    title = map['title'];
    content = map['content'] ?? '';
    section = map['section'] ?? '';
    category = map['category'] ?? '';
    updatedAt =
        map['updatedAt'] != null ? formatDate(map['updatedAt']) : null;
  }

  DateTime formatDate(String date) {
    if (Platform.isAndroid) {
      date = date.replaceRange(20, 30, '');
      return DateFormat("EEE MMM dd HH:mm:ss yyyy").parse(date);
    }
    return DateTime.fromMillisecondsSinceEpoch((num.parse(date) * 1000).round());
  }
}
