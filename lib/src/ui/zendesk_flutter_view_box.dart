import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';
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
    return GestureDetector(
        onTap: () => handleTap(context),
        child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: SizeProvider.instance.size(20)),
            padding: EdgeInsets.symmetric(
                horizontal: SizeProvider.instance.size(20),
                vertical: SizeProvider.instance.size(24)),
            decoration: BoxDecoration(
                color: ColorProvider.white,
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
