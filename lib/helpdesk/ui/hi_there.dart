/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiki_style/tiki_style.dart';

class HelpdeskUiHiThere extends StatelessWidget {
  static const String _text = "Hi there 👋";

  const HelpdeskUiHiThere({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          top: SizeProvider.instance.size(45),
        ),
        child: Text(_text,
            style: TextStyle(
                color: ColorProvider.tikiPurple,
                fontWeight: FontWeight.bold,
                fontFamily: TextProvider.familyKoara,
                package: 'tiki_style',
                fontSize: SizeProvider.instance.size(29))));
  }
}
