import 'article.dart';

class HelpdeskSection {
  late num id;
  late num parentId;
  late String title;
  late String category;
  late String content;
  late List<HelpdeskArticle> articles;

  HelpdeskSection.fromMap(Map map) {
    id = map['id'];
    title = map['title'];
    content = map['description'];
    category = map['category'] ?? '';
    articles = map['articles'] ?? <HelpdeskArticle>[];
  }
}
