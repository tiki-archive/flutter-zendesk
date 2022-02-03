

import 'package:flutter/material.dart';
import 'package:zendesk_flutter/src/zendesk_flutter_service.dart';
import 'package:zendesk_flutter/src/zendesk_flutter_style.dart';

class ZendeskFlutter {
  final ZendeskFlutterService _service;

  ZendeskFlutter({ZendeskFlutterStyle? style}) :
        _service = ZendeskFlutterService(style ?? ZendeskFlutterStyle());

  show(BuildContext context) => _service.presenter.showModal(context);
}
