

import 'zendesk_flutter_section.dart';

class ZendeskFlutterCategory {
  late num id;
  late String title;
  late String content;
  late List<ZendeskFlutterSection> sections;

  ZendeskFlutterCategory.fromMap(Map map) {
    id = map['id'];
    title = map['title'];
    content = map['description'];
    sections = map['sections'] ?? <ZendeskFlutterSection>[];
  }
}
