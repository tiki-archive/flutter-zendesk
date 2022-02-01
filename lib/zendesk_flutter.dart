/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */


import 'package:flutter/material.dart';

import 'src/zendesk_flutter_service.dart';

class ZendeskFlutter {
  final ZendeskFlutterService _service;

  ZendeskFlutter() : _service = ZendeskFlutterService();

  Future<void> show(BuildContext context) => _service.presenter.render(context);
}
