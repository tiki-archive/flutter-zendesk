import 'package:flutter/services.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_article.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_category.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_section.dart';


class ZendeskFlutterApi {
  static const _platform = MethodChannel('com.mytiki.app');

  Future<List<ZendeskFlutterCategory>> getZendeskCategories(
      {bool includeSections = false}) async {
    List apiCats = await _platform.invokeMethod("getZendeskCategories");
    List<ZendeskFlutterCategory> cats =
        apiCats.map((e) => ZendeskFlutterCategory.fromMap(e)).toList();
    if (includeSections) {
      for (int i = 0; i < cats.length; i++) {
        ZendeskFlutterCategory category = cats[i];
        category.sections = await getZendeskSectionsForCategory(category);
      }
    }
    return cats;
  }

  Future<List<ZendeskFlutterSection>> getZendeskSectionsForCategory(
      ZendeskFlutterCategory category) async {
    return (await getZendeskSections(category.id)).map((section) {
      section.category = category.title;
      section.parentId = category.id;
      return section;
    }).toList();
  }

  Future<List<ZendeskFlutterSection>> getZendeskSections(num categoryId,
      {bool includeArticles = false}) async {
    List apiSections = await _platform
        .invokeMethod("getZendeskSections", {"categoryId": categoryId});
    List<ZendeskFlutterSection> sections =
        apiSections.map((e) => ZendeskFlutterSection.fromMap(e)).toList();
    if (includeArticles) {
      for (int i = 0; i < sections.length; i++) {
        ZendeskFlutterSection section = sections[i];
        section.articles = await getZendeskArticles(section.id);
      }
    }
    return sections;
  }

  Future<List<ZendeskFlutterArticle>> getZendeskArticlesForSection(
      ZendeskFlutterSection section) async {
    return (await getZendeskArticles(section.id)).map((article) {
      article.category = section.category;
      article.section = section.title;
      article.parentId = section.id;
      return article;
    }).toList();
  }

  Future<List<ZendeskFlutterArticle>> getZendeskArticles(num sectionId,
      {String category = '', String section = ''}) async {
    List apiArticles = await _platform
        .invokeMethod("getZendeskArticles", {"sectionId": sectionId});
    List<ZendeskFlutterArticle> articles = apiArticles.map((e) {
      ZendeskFlutterArticle article = ZendeskFlutterArticle.fromMap(e);
      article.category = category;
      article.section = section;
      return article;
    }).toList();
    return articles;
  }

  Future<ZendeskFlutterArticle> getZendeskArticle(num articleId,
      {num parentId = 0, String section = '', String category = ''}) async {
    ZendeskFlutterArticle article = ZendeskFlutterArticle.fromMap(await _platform
        .invokeMethod("getZendeskArticle", {"articleId": articleId}));
    article.parentId = parentId;
    return article;
  }
}
