import 'zendesk_flutter_article.dart';

class ZendeskFlutterSection {
  late num id;
  late num parentId;
  late String title;
  late String category;
  late String content;
  late List<ZendeskFlutterArticle> articles;

  ZendeskFlutterSection.fromMap(Map map) {
    id = map['id'];
    title = map['title'];
    content = map['description'];
    category = map['category'] ?? '';
    articles = map['articles'] ?? <ZendeskFlutterArticle>[];
  }
}
