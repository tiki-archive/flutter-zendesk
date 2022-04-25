/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';

import 'model/zendesk_flutter_article.dart';
import 'model/zendesk_flutter_category.dart';
import 'model/zendesk_flutter_model.dart';
import 'model/zendesk_flutter_section.dart';
import 'zendesk_flutter_api.dart';
import 'zendesk_flutter_controller.dart';
import 'zendesk_flutter_presenter.dart';

class ZendeskFlutterService extends ChangeNotifier {
  late final ZendeskFlutterPresenter presenter;
  late final ZendeskFlutterController controller;
  late final ZendeskFlutterModel model;
  final ZendeskFlutterApi zendeskApi = ZendeskFlutterApi();

  ZendeskFlutterService() {
    presenter = ZendeskFlutterPresenter(this);
    controller = ZendeskFlutterController(this);
    model = ZendeskFlutterModel();
    getCategories();
  }

  Future<void> getCategories() async {
    model.data =
        await zendeskApi.getZendeskCategories(includeSections: true);
    model.category = null;
    notifyListeners();
  }

  Future<void> getSectionsForCategory(ZendeskFlutterCategory category) async {
    model.data = await zendeskApi.getZendeskSections(category.id,
        includeArticles: true);
    model.category = category;
    notifyListeners();
  }

  Future<void> getArticlesForSection(ZendeskFlutterSection section) async {
    model.data = await zendeskApi.getZendeskArticles(section.id,
        category: section.category);
    model.section = section;
    model.article = null;
    notifyListeners();
  }

  Future<void> getArticleById(ZendeskFlutterArticle article) async {
    model.data = await zendeskApi.getZendeskArticle(article.id,
        section: article.section, category: article.category);
    model.article = article;
    notifyListeners();
  }
}
