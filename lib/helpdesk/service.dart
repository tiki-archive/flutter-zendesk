/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';

import 'api.dart';
import 'controller.dart';
import 'model/article.dart';
import 'model/category.dart';
import 'model/model.dart';
import 'model/section.dart';
import 'presenter.dart';

class HelpdeskService extends ChangeNotifier {
  late final HelpdeskPresenter presenter;
  late final HelpdeskController controller;
  late final HelpdeskModel model;
  final HelpdeskApi zendeskApi = HelpdeskApi();

  HelpdeskService() {
    presenter = HelpdeskPresenter(this);
    controller = HelpdeskController(this);
    model = HelpdeskModel();
    getCategories();
  }

  Future<void> getCategories() async {
    model.data =
        await zendeskApi.getZendeskCategories(includeSections: true);
    model.category = null;
    notifyListeners();
  }

  Future<void> getSectionsForCategory(HelpdeskCategory category) async {
    model.data = await zendeskApi.getZendeskSections(category.id,
        includeArticles: true);
    model.category = category;
    notifyListeners();
  }

  Future<void> getArticlesForSection(HelpdeskSection section) async {
    model.data = await zendeskApi.getZendeskArticles(section.id,
        category: section.category);
    model.section = section;
    model.article = null;
    notifyListeners();
  }

  Future<void> getArticleById(HelpdeskArticle article) async {
    model.data = await zendeskApi.getZendeskArticle(article.id,
        section: article.section, category: article.category);
    model.article = article;
    notifyListeners();
  }
}
