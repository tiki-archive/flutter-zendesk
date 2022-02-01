

import 'zendesk_flutter_section.dart';

class ZendeskFlutterCategory {
  late num id;
  late String title;
  late String content;
  late List<ZendeskFlutterSection> sections;

  ZendeskFlutterCategory.fromMap(Map map) {
    this.id = map['id'];
    this.title = map['title'];
    this.content = map['description'];
    this.sections = map['sections'] ?? <ZendeskFlutterSection>[];
  }
}
