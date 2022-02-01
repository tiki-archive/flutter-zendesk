

import 'package:flutter/material.dart';
import 'package:zendesk_flutter/src/zendesk_flutter_service.dart';

class ZendeskFlutter {
  final ZendeskFlutterService _service;

  ZendeskFlutter() : _service = ZendeskFlutterService();

  show(BuildContext context) => _service.presenter.showModal(context);
}
