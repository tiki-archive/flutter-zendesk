import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../service.dart';
import 'box_content.dart';
import 'box_subtitle.dart';
import 'box_title.dart';

class HelpdeskUiBox extends StatelessWidget {
  final dynamic data;
  final bool excerpt;

  const HelpdeskUiBox(this.data, {Key? key, this.excerpt = true}) : super(key: key);

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
              HelpdeskUiBoxTitle(data),
              HelpdeskUiBoxSubtitle(data),
              HelpdeskUiBoxContent(data, excerpt: excerpt)
            ])));
  }

  handleTap(BuildContext context) {
    HelpdeskService service =
        Provider.of<HelpdeskService>(context, listen: false);
    service.controller.onBoxTap(data);
  }
}
