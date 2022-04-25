import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:style/style.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_article.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_category.dart';
import 'package:zendesk_flutter/src/model/zendesk_flutter_section.dart';
import 'package:zendesk_flutter/src/zendesk_flutter_service.dart';

class ZendeskFlutterViewBreadcrumb extends StatelessWidget {
  final String catText =
      "Welcome to our Help Center. Search for an\nanswer or check out our articles below.";
  final String separator = " > ";

  const ZendeskFlutterViewBreadcrumb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ZendeskFlutterService service = Provider.of<ZendeskFlutterService>(context);
    String text = _getBreadcrumbText(service);
    return Container(
        padding: EdgeInsets.only(top: SizeProvider.instance.size(30)),
        alignment: Alignment.centerLeft,
        child: Text(text,
            style: TextStyle(
                color: service.model.data == null ||
                        service.model.data is List<ZendeskFlutterCategory>
                    ? ColorProvider.tikiBlue
                    : ColorProvider.tikiBlack,
                fontFamily: TextProvider.familyNunitoSans,
                package: 'style',
                fontWeight: FontWeight.bold,
                fontSize: SizeProvider.instance.size(16)),
            textAlign: TextAlign.start));
  }

  String _getBreadcrumbText(ZendeskFlutterService service) {
    String leadText = "All categories";
    if (service.model.data == null) return '';
    if (service.model.data is List<ZendeskFlutterSection> &&
        service.model.data.length > 0) {
      String cat = service.model.category?.title ?? '';
      return leadText + separator + cat;
    }
    if (service.model.data is List<ZendeskFlutterArticle>) {
      String cat = service.model.category?.title ?? '';
      String section = service.model.section?.title ?? '';
      return leadText + separator + cat + separator + section;
    } else if (service.model.data is ZendeskFlutterArticle) {
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
