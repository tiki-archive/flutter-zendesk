import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../model/article.dart';
import '../model/category.dart';
import '../model/section.dart';
import '../service.dart';

class HelpdeskUiBoxSubtitle extends StatelessWidget {
  final dynamic data;

  const HelpdeskUiBoxSubtitle(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextSpan text = getSubtitle(context);
    return Container(
        alignment: Alignment.centerLeft, child: RichText(text: text));
  }

  TextSpan getSubtitle(BuildContext context) {
    HelpdeskService service = Provider.of<HelpdeskService>(context);
    Color color = getColor(data, service);
    if (data is HelpdeskCategory) {
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
    if (data is HelpdeskSection) {
      num count = data.articles.length;
      String text = count.toString() + " articles";
      return TextSpan(
          text: text,
          style:
              TextStyle(color: color, fontFamily: TextProvider.familyNunitoSans,
                package: 'tiki_style',));
    }
    if (data is HelpdeskArticle) {
      DateTime date = data.updatedAt;
      String publishedDate = DateFormat("dd MMMM yyyy").format(date);
      return TextSpan(
        text: "published on $publishedDate",
        style: TextStyle(color: color,
            fontFamily: TextProvider.familyNunitoSans,
            package: 'style',
            fontWeight: color == ColorProvider.greyFive ? FontWeight.bold : FontWeight.normal),
      );
    }
    return const TextSpan(text: '');
  }

  Color getColor(dynamic data, HelpdeskService service) {
    if (data is HelpdeskCategory || data is HelpdeskSection) {
      return ColorProvider.tikiBlue;
    }
    return ColorProvider.greyFive;
  }
}
