import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zendesk_flutter/src/zendesk_flutter_service.dart';

class ZendeskFlutterViewBoxTitle extends StatelessWidget {
  final dynamic data;

  const ZendeskFlutterViewBoxTitle(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ZendeskFlutterService service = Provider.of<ZendeskFlutterService>(context);
    return Container(
        alignment: Alignment.centerLeft,
        child: Text(data.title ?? "",
            style: TextStyle(
                color: service.style.titleColor,
                fontSize: service.style.titleTextSize,
                fontFamily: service.style.titleFont,
                fontWeight: service.style.titleFontWeight)));
  }
}
