/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recover/src/model/zendesk_flutter_article.dart';
import 'package:recover/src/model/zendesk_flutter_category.dart';
import 'package:recover/src/model/zendesk_flutter_section.dart';

import '../zendesk_flutter_service.dart';
import 'zendesk_flutter_view_box.dart';
import 'zendesk_flutter_view_breadcrumb.dart';
import 'zendesk_flutter_view_header.dart';
import 'zendesk_flutter_view_hi_there.dart';

class ZendeskFlutterLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            height: 85.h,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ZendeskFlutterViewHeader(),
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 6.w, right: 6.w, bottom: 5.h),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            ZendeskFlutterViewHiThere(),
                            //ZendeskFlutterSearch(),
                            ZendeskFlutterViewBreadcrumb(),
                            Container(child: _getSupportContent(context)),
                          ]))))
            ])));
  }

  Widget _getSupportContent(BuildContext context) {
    ZendeskFlutterService service = Provider.of<ZendeskFlutterService>(context);
    if (service.model.data == null)
      return Container(
          padding: EdgeInsets.only(top: 5.h),
          child: CircularProgressIndicator());
    if (service.model.data is List<ZendeskFlutterCategory> ||
        service.model.data is List<ZendeskFlutterSection> ||
        service.model.data is List<ZendeskFlutterArticle>)
      return Column(children: _getViewBoxList(service.model.data));
    return ZendeskFlutterViewBox(service.model.data, excerpt: false);
  }

  List<Widget> _getViewBoxList(dynamic data) {
    List<Widget> viewBoxList = [];
    data.forEach((el) => viewBoxList.add(ZendeskFlutterViewBox(el)));
    return viewBoxList;
  }
}
