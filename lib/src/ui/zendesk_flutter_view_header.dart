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
    return Padding(padding: EdgeInsets.only(top: SizeProvider.instance.size(24)),
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
                      padding: EdgeInsets.only(left: SizeProvider.instance.size(25)),
                      child: Center(
                          child: isBackActive ? const Icon(IconProvider.arrow_back, size: 20)
                           : SizedBox.fromSize(
                                size: Size(SizeProvider.instance.size(10),SizeProvider.instance.size(10))))))),
          Container(
              alignment: Alignment.center,
              child: Text(_text,
                  style: TextStyle(
                      color: ColorProvider.tikiBlue,
                      fontWeight: FontWeight.bold,
                      fontFamily: TextProvider.familyKoara,
                      package: 'style',
                      fontSize: SizeProvider.instance.size(16)))),
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                        padding: EdgeInsets.only(right: SizeProvider.instance.size(25)),
                        child: const Center(
                            child: Icon(IconProvider.close, size: 20)
                            )))),
    ]));
  }
}
