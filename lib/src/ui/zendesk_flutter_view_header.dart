/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:style/style.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_category.dart';
import 'package:zendesk_flutter/src/zendesk_flutter_service.dart';

class ZendeskFlutterViewHeader extends StatelessWidget {
  static const String _text = "Help Center";

  const ZendeskFlutterViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ZendeskFlutterService service = Provider.of<ZendeskFlutterService>(context);
    bool isBackActive =
        service.model.data != null &&
            service.model.data is! List<ZendeskFlutterCategory>;
    return Padding(padding: EdgeInsets.only(top: service.style.size(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => isBackActive ? service.controller.navigateBack(context) : null,
              child: Container(
                  alignment: Alignment.center,
                  child: Container(
                      padding: EdgeInsets.only(left: service.style.size(25)),
                      child: Center(
                          child: isBackActive ? const Icon(IconProvider.arrow_back, size: 20)
                           : SizedBox.fromSize(
                                size: Size(service.style.size(10),service.style.size(10))))))),
          Container(
              alignment: Alignment.center,
              child: Text(_text,
                  style: TextStyle(
                      color: service.style.accentColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: service.style.fontFamily,
                      fontSize: service.style.size(16)))),
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                        padding: EdgeInsets.only(right: service.style.size(25)),
                        child: const Center(
                            child: Icon(IconProvider.close, size: 20)
                            )))),
    ]));
  }
}
