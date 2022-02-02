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
                color: service.style.accentColor,
                fontSize: service.style.size(24),
                fontFamily: service.style.titleFont,
                fontWeight: FontWeight.w700)));
  }
}
