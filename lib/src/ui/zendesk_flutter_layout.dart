/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:style/style.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_article.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_category.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_section.dart';
import 'package:zendesk_flutter/src/zendesk_flutter_service.dart';
import 'zendesk_flutter_view_box.dart';
import 'zendesk_flutter_view_breadcrumb.dart';
import 'zendesk_flutter_view_header.dart';
import 'zendesk_flutter_view_hi_there.dart';

class ZendeskFlutterLayout extends StatelessWidget {

  const ZendeskFlutterLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SizedBox(
            height: MediaQuery.of(context).size.height*0.8,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const ZendeskFlutterViewHeader(),
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeProvider.instance.size(25),
                              right: SizeProvider.instance.size(25),
                              bottom: SizeProvider.instance.size(16)),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            const ZendeskFlutterViewHiThere(),
                            //ZendeskFlutterSearch(),
                            const ZendeskFlutterViewBreadcrumb(),
                            Container(child: _getSupportContent(context)),
                          ]))))
            ])));
  }

  Widget _getSupportContent(BuildContext context) {
    ZendeskFlutterService service = Provider.of<ZendeskFlutterService>(context);
    if (service.model.data == null) {
      return Container(
          padding: EdgeInsets.only(top: SizeProvider.instance.size(15)),
          child: const CircularProgressIndicator());
    }
    if (service.model.data is List<ZendeskFlutterCategory> ||
        service.model.data is List<ZendeskFlutterSection> ||
        service.model.data is List<ZendeskFlutterArticle>) {
      return Column(children: _getViewBoxList(service.model.data));
    }
    return ZendeskFlutterViewBox(service.model.data, excerpt: false);
  }

  List<Widget> _getViewBoxList(dynamic data) {
    List<Widget> viewBoxList = [];
    data.forEach((el) => viewBoxList.add(ZendeskFlutterViewBox(el)));
    return viewBoxList;
  }
}
