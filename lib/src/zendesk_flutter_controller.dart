/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zendesk_flutter/model/zendesk_flutter_article.dart';
import 'package:zendesk_flutter/model/zendesk_flutter_category.dart';
import 'package:zendesk_flutter/model/zendesk_flutter_section.dart';

import 'zendesk_flutter_service.dart';

class ZendeskFlutterController {
  final ZendeskFlutterService service;

  ZendeskFlutterController(this.service);

  void onBoxTap(dynamic boxData) {
    if (boxData is ZendeskFlutterCategory) service.getSectionsForCategory(boxData);
    if (boxData is ZendeskFlutterSection) service.getArticlesForSection(boxData);
    if (boxData is ZendeskFlutterArticle) service.getArticleById(boxData);
  }

  navigateBack(BuildContext context) {
    if (service.model.data is List<ZendeskFlutterSection>) service.getCategories();
    if (service.model.data is List<ZendeskFlutterArticle>) {
      service.getSectionsForCategory(service.model.category!);
    }
    if (service.model.data is ZendeskFlutterArticle) {
      service.getArticlesForSection(service.model.section!);
    }
  }

  Future<void> launchUrl(String url) async {
    if (!url.startsWith(RegExp('https?:/\/'))) {
      url = "http://" + url;
    }
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }
}
