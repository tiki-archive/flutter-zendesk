import 'package:flutter/material.dart';
import 'package:style/style.dart';

class ZendeskFlutterViewBoxTitle extends StatelessWidget {
  final dynamic data;

  const ZendeskFlutterViewBoxTitle(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Text(data.title ?? "",
            style: TextStyle(
                color: ColorProvider.tikiBlue,
                fontSize: SizeProvider.instance.size(24),
                fontFamily: TextProvider.familyNunitoSans,
                package: 'style',
                fontWeight: FontWeight.w700)));
  }
}
