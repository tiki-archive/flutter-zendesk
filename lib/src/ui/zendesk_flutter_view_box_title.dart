import 'package:flutter/material.dart';

class ZendeskFlutterViewBoxTitle extends StatelessWidget {
  final dynamic data;

  const ZendeskFlutterViewBoxTitle(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Text(data.title ?? "",
            style: TextStyle(
                color: ConfigColor.tikiPurple,
                fontSize: 20.sp,
                fontFamily: ConfigFont.familyNunitoSans,
                fontWeight: FontWeight.w700)));
  }
}
