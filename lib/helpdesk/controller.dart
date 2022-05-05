/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'model/article.dart';
import 'model/category.dart';
import 'model/section.dart';
import 'service.dart';

class HelpdeskController {
  final HelpdeskService service;

  HelpdeskController(this.service);

  void onBoxTap(dynamic boxData) {
    if (boxData is HelpdeskCategory) service.getSectionsForCategory(boxData);
    if (boxData is HelpdeskSection) service.getArticlesForSection(boxData);
    if (boxData is HelpdeskArticle) service.getArticleById(boxData);
  }

  navigateBack(BuildContext context) {
    if (service.model.data is List<HelpdeskSection>) service.getCategories();
    if (service.model.data is List<HelpdeskArticle>) {
      service.getSectionsForCategory(service.model.category!);
    }
    if (service.model.data is HelpdeskArticle) {
      service.getArticlesForSection(service.model.section!);
    }
  }

  Future<void> launchUrl(String url) async {
    if (!url.startsWith(RegExp('https?://'))) {
      url = "http://" + url;
    }
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }
}
