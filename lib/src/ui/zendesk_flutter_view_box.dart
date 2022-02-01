import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../zendesk_flutter_service.dart';
import 'zendesk_flutter_view_box_content.dart';
import 'zendesk_flutter_view_box_subtitle.dart';
import 'zendesk_flutter_view_box_title.dart';

class ZendeskFlutterViewBox extends StatelessWidget {
  static const double _cardMarginTop = 2.25;
  final dynamic data;
  final bool excerpt;

  const ZendeskFlutterViewBox(this.data, {this.excerpt = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => handleTap(context),
        child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: _cardMarginTop.h),
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            decoration: BoxDecoration(
                color: ConfigColor.white,
                borderRadius: BorderRadius.circular(24)),
            child: Column(children: <Widget>[
              ZendeskFlutterViewBoxTitle(data),
              ZendeskFlutterViewBoxSubtitle(data),
              ZendeskFlutterViewBoxContent(data, excerpt: this.excerpt)
            ])));
  }

  handleTap(BuildContext context) {
    ZendeskFlutterService service =
        Provider.of<ZendeskFlutterService>(context, listen: false);
    service.controller.onBoxTap(this.data);
  }
}
