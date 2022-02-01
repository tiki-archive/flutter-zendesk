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
    this.presenter = ZendeskFlutterPresenter(this);
    this.controller = ZendeskFlutterController(this);
    this.model = ZendeskFlutterModel();
    getCategories();
  }

  Future<void> getCategories() async {
    this.model.data =
        await zendeskApi.getZendeskCategories(includeSections: true);
    this.model.category = null;
    notifyListeners();
  }

  Future<void> getSectionsForCategory(ZendeskFlutterCategory category) async {
    this.model.data = await zendeskApi.getZendeskSections(category.id,
        includeArticles: true);
    this.model.category = category;
    notifyListeners();
  }

  Future<void> getArticlesForSection(ZendeskFlutterSection section) async {
    this.model.data = await zendeskApi.getZendeskArticles(section.id,
        category: section.category);
    this.model.section = section;
    this.model.article = null;
    notifyListeners();
  }

  Future<void> getArticleById(ZendeskFlutterArticle article) async {
    this.model.data = await zendeskApi.getZendeskArticle(article.id,
        section: article.section, category: article.category);
    this.model.article = article;
    notifyListeners();
  }
}
