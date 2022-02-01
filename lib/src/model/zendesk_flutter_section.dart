import 'zendesk_flutter_article.dart';

class ZendeskFlutterSection {
  late num id;
  late num parentId;
  late String title;
  late String category;
  late String content;
  late List<ZendeskFlutterArticle> articles;

  ZendeskFlutterSection.fromMap(Map map) {
    this.id = map['id'];
    this.title = map['title'];
    this.content = map['description'];
    this.category = map['category'] ?? '';
    this.articles = map['articles'] ?? <ZendeskFlutterArticle>[];
  }
}
