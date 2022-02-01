import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recover/src/model/zendesk_flutter_article.dart';
import 'package:recover/src/model/zendesk_flutter_category.dart';
import 'package:recover/src/model/zendesk_flutter_section.dart';

import '../zendesk_flutter_service.dart';

class ZendeskFlutterViewBreadcrumb extends StatelessWidget {
  final String catText =
      "Welcome to our Help Center. Search for an\nanswer or check out our articles below.";
  final String separator = " > ";
  final Color catColor = ConfigColor.tikiBlue;
  final Color defaultColor = ConfigColor.greyFive;

  @override
  Widget build(BuildContext context) {
    ZendeskFlutterService service = Provider.of<ZendeskFlutterService>(context);
    String text = _getBreadcrumbText(service);
    return Container(
        padding: EdgeInsets.only(top: 3.h),
        alignment: Alignment.centerLeft,
        child: Text(text,
            style: TextStyle(
                color: service.model.data == null ||
                        service.model.data is List<ZendeskFlutterCategory>
                    ? this.catColor
                    : this.defaultColor,
                fontFamily: ConfigFont.familyNunitoSans,
                fontWeight: FontWeight.w600,
                fontSize: 11.sp),
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
