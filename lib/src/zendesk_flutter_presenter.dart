/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/support_modal_layout.dart';
import 'ui/zendesk_flutter_layout.dart';
import 'zendesk_flutter_service.dart';

class ZendeskFlutterPresenter {
  final ZendeskFlutterService service;

  ZendeskFlutterPresenter(this.service);

  ChangeNotifierProvider<ZendeskFlutterService> render() {
    return ChangeNotifierProvider.value(
        value: service, child: ZendeskFlutterLayout());
  }

  Future<void> showModal(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: ConfigColor.greyTwo,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(6.h))),
        builder: (BuildContext context) => render());
  }
}
