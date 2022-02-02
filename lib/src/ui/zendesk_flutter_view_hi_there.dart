/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:zendesk_flutter/src/zendesk_flutter_service.dart';

class ZendeskFlutterViewHiThere extends StatelessWidget {
  static const String _text = "Hi there 👋";

  const ZendeskFlutterViewHiThere({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ZendeskFlutterService service = Provider.of<ZendeskFlutterService>(context);
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          top: service.style.size(24),
        ),
        child: Text(_text,
            style: TextStyle(
                color: service.style.accentColor,
                fontWeight: FontWeight.bold,
                fontFamily: service.style.titleFont,
                fontSize: service.style.size(28))));
  }
}
