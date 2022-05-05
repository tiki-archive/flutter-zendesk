

import 'section.dart';

class HelpdeskCategory {
  late num id;
  late String title;
  late String content;
  late List<HelpdeskSection> sections;

  HelpdeskCategory.fromMap(Map map) {
    id = map['id'];
    title = map['title'];
    content = map['description'];
    sections = map['sections'] ?? <HelpdeskSection>[];
  }
}
