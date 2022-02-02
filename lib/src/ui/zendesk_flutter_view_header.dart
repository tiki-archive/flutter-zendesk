/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_category.dart';
import 'package:zendesk_flutter/src/zendesk_flutter_service.dart';

class ZendeskFlutterViewHeader extends StatelessWidget {
  static const String _text = "Help Center";

  const ZendeskFlutterViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ZendeskFlutterService service = Provider.of<ZendeskFlutterService>(context);
    return Stack(children: [
      GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: Container(
              alignment: Alignment.centerRight,
              child: Container(
                  width: service.style.size(25),
                  height: service.style.size(25),
                  padding: EdgeInsets.only(right: service.style.size(20)),
                  child: Center(
                      child: Image.asset(
                        "res/images/icon-back",
                        width: service.style.size(25),
                        height: service.style.size(25),
                      ))))),
      if (service.model.data != null &&
          service.model.data is! List<ZendeskFlutterCategory>)
        GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => service.controller.navigateBack(context),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Container(
                    width: service.style.size(25),
                    height: service.style.size(25),
                    padding: EdgeInsets.only(right: service.style.size(25)),
                    child: Center(
                        child: Image.asset(
                      "res/images/icon-back",
                      width: service.style.size(25),
                      height: service.style.size(25),
                      package: 'zendesk_flutter'
                    ))))),
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            top: service.style.size(24),
          ),
          child: Text(_text,
              style: TextStyle(
                  color: service.style.accentColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: service.style.fontFamily,
                  fontSize: service.style.size(16)))),
    ]);
  }
}
