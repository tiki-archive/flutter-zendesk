import 'package:flutter/services.dart';

import 'model/article.dart';
import 'model/category.dart';
import 'model/section.dart';


class HelpdeskApi {
  static const _platform = MethodChannel('com.mytiki.zendesk_flutter');

  Future<List<HelpdeskCategory>> getZendeskCategories(
      {bool includeSections = false}) async {
    List apiCats = await _platform.invokeMethod("getZendeskCategories");
    List<HelpdeskCategory> cats =
        apiCats.map((e) => HelpdeskCategory.fromMap(e)).toList();
    if (includeSections) {
      for (int i = 0; i < cats.length; i++) {
        HelpdeskCategory category = cats[i];
        category.sections = await getZendeskSectionsForCategory(category);
      }
    }
    return cats;
  }

  Future<List<HelpdeskSection>> getZendeskSectionsForCategory(
      HelpdeskCategory category) async {
    return (await getZendeskSections(category.id)).map((section) {
      section.category = category.title;
      section.parentId = category.id;
      return section;
    }).toList();
  }

  Future<List<HelpdeskSection>> getZendeskSections(num categoryId,
      {bool includeArticles = false}) async {
    List apiSections = await _platform
        .invokeMethod("getZendeskSections", {"categoryId": categoryId});
    List<HelpdeskSection> sections =
        apiSections.map((e) => HelpdeskSection.fromMap(e)).toList();
    if (includeArticles) {
      for (int i = 0; i < sections.length; i++) {
        HelpdeskSection section = sections[i];
        section.articles = await getZendeskArticles(section.id);
      }
    }
    return sections;
  }

  Future<List<HelpdeskArticle>> getZendeskArticlesForSection(
      HelpdeskSection section) async {
    return (await getZendeskArticles(section.id)).map((article) {
      article.category = section.category;
      article.section = section.title;
      article.parentId = section.id;
      return article;
    }).toList();
  }

  Future<List<HelpdeskArticle>> getZendeskArticles(num sectionId,
      {String category = '', String section = ''}) async {
    List apiArticles = await _platform
        .invokeMethod("getZendeskArticles", {"sectionId": sectionId});
    List<HelpdeskArticle> articles = apiArticles.map((e) {
      HelpdeskArticle article = HelpdeskArticle.fromMap(e);
      article.category = category;
      article.section = section;
      return article;
    }).toList();
    return articles;
  }

  Future<HelpdeskArticle> getZendeskArticle(num articleId,
      {num parentId = 0, String section = '', String category = ''}) async {
    HelpdeskArticle article = HelpdeskArticle.fromMap(await _platform
        .invokeMethod("getZendeskArticle", {"articleId": articleId}));
    article.parentId = parentId;
    return article;
  }
}
