import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:style/style.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_article.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_category.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_section.dart';
import 'package:zendesk_flutter/src/zendesk_flutter_service.dart';

class ZendeskFlutterViewBoxSubtitle extends StatelessWidget {
  final dynamic data;

  const ZendeskFlutterViewBoxSubtitle(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextSpan text = getSubtitle(context);
    return Container(
        alignment: Alignment.centerLeft, child: RichText(text: text));
  }

  TextSpan getSubtitle(BuildContext context) {
    ZendeskFlutterService service = Provider.of<ZendeskFlutterService>(context);
    Color color = getColor(data, service);
    if (data is ZendeskFlutterCategory) {
      num count = data.sections.length;
      String text = count.toString() + " sections";
      return TextSpan(
        text: text,
        style: TextStyle(
            fontSize: SizeProvider.instance.size(14),
            fontWeight: FontWeight.w600,
            color: color,
          fontFamily: TextProvider.familyNunitoSans,
          package: 'style'),
      );
    }
    if (data is ZendeskFlutterSection) {
      num count = data.articles.length;
      String text = count.toString() + " articles";
      return TextSpan(
          text: text,
          style:
              TextStyle(color: color, fontFamily: TextProvider.familyNunitoSans,
                package: 'style',));
    }
    if (data is ZendeskFlutterArticle) {
      DateTime date = data.updatedAt;
      String publishedDate = DateFormat("dd MMMM yyyy").format(date);
      return TextSpan(
        text: "published on $publishedDate",
        style: TextStyle(color: color,  fontFamily: TextProvider.familyNunitoSans,
          package: 'style'),
      );
    }
    return const TextSpan(text: '');
  }

  Color getColor(dynamic data, ZendeskFlutterService service) {
    if (data is ZendeskFlutterCategory || data is ZendeskFlutterSection) {
      return ColorProvider.tikiBlue;
    }
    return ColorProvider.tikiBlack;
  }
}
