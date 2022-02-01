/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zendesk_flutter/ui/zendesk_flutter_layout.dart';
import 'zendesk_flutter_service.dart';
import 'zendesk_flutter_style.dart';

class ZendeskFlutterPresenter {
  final ZendeskFlutterService service;
  final ZendeskFlutterStyle style;

  ZendeskFlutterPresenter(this.service, this.style);

  ChangeNotifierProvider<ZendeskFlutterService> render() {
    return ChangeNotifierProvider.value(
        value: service, child: const ZendeskFlutterLayout());
  }

  Future<void> showModal(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: style.backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(style.modalRadius))),
        builder: (BuildContext context) => render());
  }
}
