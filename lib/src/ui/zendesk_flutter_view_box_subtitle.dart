import 'package:flutter/material.dart';
import 'package:recover/src/model/zendesk_flutter_article.dart';
import 'package:recover/src/model/zendesk_flutter_category.dart';
import 'package:recover/src/model/zendesk_flutter_section.dart';

class ZendeskFlutterViewBoxSubtitle extends StatelessWidget {
  final dynamic data;

  ZendeskFlutterViewBoxSubtitle(this.data);

  @override
  Widget build(BuildContext context) {
    TextSpan text = getSubtitle();
    return Container(
        alignment: Alignment.centerLeft, child: RichText(text: text));
  }

  TextSpan getSubtitle() {
    Color color = getColor(data);
    if (data is ZendeskFlutterCategory) {
      num count = data.sections.length;
      String text = count.toString() + " sections";
      return TextSpan(
        text: text,
        style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: color,
            fontFamily: ConfigFont.familyNunitoSans),
      );
    }
    if (data is ZendeskFlutterSection) {
      num count = data.articles.length;
      String text = count.toString() + " articles";
      return TextSpan(
          text: text,
          style:
              TextStyle(color: color, fontFamily: ConfigFont.familyNunitoSans));
    }
    if (data is ZendeskFlutterArticle) {
      DateTime date = data.updatedAt;
      String publishedDate = DateFormat("dd MMMM yyyy").format(date);
      return TextSpan(
        text: "published on $publishedDate",
        style: TextStyle(color: color, fontFamily: ConfigFont.familyNunitoSans),
      );
    }
    return TextSpan(text: '');
  }

  Color getColor(data) {
    if (data is ZendeskFlutterCategory || data is ZendeskFlutterSection)
      return ConfigColor.blue;
    return ConfigColor.greyFive;
  }
}
