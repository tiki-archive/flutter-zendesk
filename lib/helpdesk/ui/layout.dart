/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';
import '../model/article.dart';
import '../model/category.dart';
import '../model/section.dart';
import '../service.dart';
import 'box.dart';
import 'breadcrumb.dart';
import 'header.dart';
import 'hi_there.dart';

class HelpdeskLayout extends StatelessWidget {

  const HelpdeskLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SizedBox(
            height: MediaQuery.of(context).size.height*0.8,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const HelpdeskUiHeader(),
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeProvider.instance.size(25),
                              right: SizeProvider.instance.size(25),
                              bottom: SizeProvider.instance.size(16)),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            const HelpdeskUiHiThere(),
                            //HelpdeskSearch(),
                            const HelpdeskUiBreadcrumb(),
                            Container(child: _getSupportContent(context)),
                          ]))))
            ])));
  }

  Widget _getSupportContent(BuildContext context) {
    HelpdeskService service = Provider.of<HelpdeskService>(context);
    if (service.model.data == null) {
      return Container(
          padding: EdgeInsets.only(top: SizeProvider.instance.size(15)),
          child: const CircularProgressIndicator());
    }
    if (service.model.data is List<HelpdeskCategory> ||
        service.model.data is List<HelpdeskSection> ||
        service.model.data is List<HelpdeskArticle>) {
      return Column(children: _getViewBoxList(service.model.data));
    }
    return HelpdeskUiBox(service.model.data, excerpt: false);
  }

  List<Widget> _getViewBoxList(dynamic data) {
    List<Widget> viewBoxList = [];
    data.forEach((el) => viewBoxList.add(HelpdeskUiBox(el)));
    return viewBoxList;
  }
}
