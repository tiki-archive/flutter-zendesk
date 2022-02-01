/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:zendesk_flutter/model/zendesk_flutter_category.dart';
import 'package:zendesk_flutter/src/zendesk_flutter_service.dart';

class ZendeskFlutterViewHeader extends StatelessWidget {
  static const String _text = "Help Center";

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
                  width: service.style.headerIconWidth,
                  height: service.style.headerIconHeight,
                  padding: EdgeInsets.only(right: service.style.headerIconPadding),
                  child: Center(
                      child: Image.asset(
                        "res/images/icon-back",
                        width: service.style.headerIconSize,
                        height: service.style.headerIconSize,
                      ))))),
      if (service.model.data != null &&
          service.model.data is! List<ZendeskFlutterCategory>)
        GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => service.controller.navigateBack(context),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Container(
                    width: service.style.headerIconWidth,
                    height: service.style.headerIconHeight,
                    padding: EdgeInsets.only(right: service.style.headerIconPadding),
                    child: Center(
                        child: Image.asset(
                      "res/images/icon-back",
                      width: service.style.headerIconSize,
                      height: service.style.headerIconSize,
                      package: 'zendesk_flutter'
                    ))))),
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            top: service.style.modalTopPadding,
          ),
          child: Text(_text,
              style: TextStyle(
                  color: service.style.titleColor,
                  fontWeight: service.style.headerFontWeight,
                  fontFamily: service.style.fontFamily,
                  fontSize: service.style.headerFontSize))),
    ]);
  }
}
