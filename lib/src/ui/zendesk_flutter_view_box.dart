import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zendesk_flutter/src/zendesk_flutter_service.dart';

import 'zendesk_flutter_view_box_content.dart';
import 'zendesk_flutter_view_box_subtitle.dart';
import 'zendesk_flutter_view_box_title.dart';

class ZendeskFlutterViewBox extends StatelessWidget {
  final dynamic data;
  final bool excerpt;

  const ZendeskFlutterViewBox(this.data, {Key? key, this.excerpt = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ZendeskFlutterService service = Provider.of<ZendeskFlutterService>(context);
    return GestureDetector(
        onTap: () => handleTap(context),
        child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: service.style.size(20)),
            padding: EdgeInsets.symmetric(
                horizontal: service.style.size(20),
                vertical: service.style.size(24)),
            decoration: BoxDecoration(
                color: service.style.cardBackground,
                borderRadius: BorderRadius.circular(24)),
            child: Column(children: <Widget>[
              ZendeskFlutterViewBoxTitle(data),
              ZendeskFlutterViewBoxSubtitle(data),
              ZendeskFlutterViewBoxContent(data, excerpt: excerpt)
            ])));
  }

  handleTap(BuildContext context) {
    ZendeskFlutterService service =
        Provider.of<ZendeskFlutterService>(context, listen: false);
    service.controller.onBoxTap(data);
  }
}
