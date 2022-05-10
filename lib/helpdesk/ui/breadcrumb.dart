import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../model/article.dart';
import '../model/category.dart';
import '../model/section.dart';
import '../service.dart';

class HelpdeskUiBreadcrumb extends StatelessWidget {
  final String catText =
      "Welcome to our Help Center. Search for an\nanswer or check out our articles below.";
  final String separator = " > ";

  const HelpdeskUiBreadcrumb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HelpdeskService service = Provider.of<HelpdeskService>(context);
    String text = _getBreadcrumbText(service);
    bool isHome = service.model.data == null ||
        service.model.data is List<HelpdeskCategory>;
    return Container(
        padding: EdgeInsets.only(top: SizeProvider.instance.size(30)),
        alignment: Alignment.centerLeft,
        child: Text(text,
            style: TextStyle(
                color: isHome
                    ? ColorProvider.tikiBlue
                    : ColorProvider.greyFive,
                fontFamily: TextProvider.familyNunitoSans,
                package: 'tiki_style',
                fontWeight: FontWeight.w600,
                fontSize: isHome ? SizeProvider.instance.size(14) : SizeProvider.instance.size(14) ),
            textAlign: TextAlign.start));
  }

  String _getBreadcrumbText(HelpdeskService service) {
    String leadText = "All categories";
    if (service.model.data == null) return '';
    if (service.model.data is List<HelpdeskSection> &&
        service.model.data.length > 0) {
      String cat = service.model.category?.title ?? '';
      return leadText + separator + cat;
    }
    if (service.model.data is List<HelpdeskArticle>) {
      String cat = service.model.category?.title ?? '';
      String section = service.model.section?.title ?? '';
      return leadText + separator + cat + separator + section;
    } else if (service.model.data is HelpdeskArticle) {
      String cat = service.model.category?.title ?? '';
      String section = service.model.section?.title ?? '';
      return leadText +
          separator +
          cat +
          separator +
          section +
          separator +
          service.model.data.title;
    }
    return catText;
  }
}
