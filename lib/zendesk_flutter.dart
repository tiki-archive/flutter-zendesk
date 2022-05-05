import 'package:flutter/material.dart';

import 'helpdesk/service.dart';

class ZendeskFlutter {
  final HelpdeskService _service;

  ZendeskFlutter() :
        _service = HelpdeskService();

  void helpDesk(BuildContext context) => _service.presenter.showModal(context);
}
