/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';
import 'ui/zendesk_flutter_layout.dart';
import 'zendesk_flutter_service.dart';

class ZendeskFlutterPresenter {
  final ZendeskFlutterService service;

  ZendeskFlutterPresenter(this.service);

  ChangeNotifierProvider<ZendeskFlutterService> render() {
    return ChangeNotifierProvider.value(
        value: service, child: const ZendeskFlutterLayout());
  }

  Future<void> showModal(BuildContext context) {
    TikiStyle.init(context);
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(SizeProvider.instance.size(36)))),
        builder: (BuildContext context) => render());
  }
}
