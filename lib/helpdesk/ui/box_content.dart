import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';
import 'package:webview_flutter/webview_flutter.dart' as webview;

import '../service.dart';


class HelpdeskUiBoxContent extends StatelessWidget {
  final dynamic data;
  final bool excerpt;

  const HelpdeskUiBoxContent(this.data, {Key? key, this.excerpt = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HelpdeskService service = Provider.of<HelpdeskService>(context);
    return Container(
        alignment: Alignment.centerLeft,
        child: excerpt ? _getExcerpt(data.content)  : Html(
            data: data.content,
            onLinkTap: (String? url, _, __, ___) {
              if (url != null) service.controller.launchUrl(url);
            },
            customRender: {
              "iframe": (RenderContext context, Widget child) {
                final attrs = context.tree.element?.attributes;
                if (attrs != null) {
                  double? width = double.tryParse(attrs['width'] ?? "");
                  double? height = double.tryParse(attrs['height'] ?? "");
                  final initialUrl = attrs['src'] != null
                      ? "https:" + attrs['src']!
                      : "about:blank";
                  return SizedBox(
                    width: width ?? (height ?? 150) * 2,
                    height: height ?? (width ?? 300) / 2,
                    child: webview.WebView(
                        initialUrl: initialUrl,
                        javascriptMode: webview.JavascriptMode.unrestricted,
                        gestureRecognizers: _gestureRecognizerFactorySet(),
                        navigationDelegate: (request) =>
                            _getNavigationDelegate(request, initialUrl)),
                  );
                } else {
                  return Container(height: 0);
                }
              }
            }));
  }

  _getNavigationDelegate(webview.NavigationRequest request, String initialUrl) {
    return request.url == initialUrl
        ? webview.NavigationDecision.navigate
        : webview.NavigationDecision.prevent;
  }

  Widget _getExcerpt(String text) {
    dom.Document document = parse(text);
    String parsedString =
        parse(document.body?.text).documentElement?.text ?? '';
    int lastIndex = parsedString.length > 100 ? parsedString.substring(0, 100).lastIndexOf(' ') : 0;
    String content = parsedString.length > 100 ? parsedString.substring(0, lastIndex) + '...' : parsedString;
    return Padding(
        padding:EdgeInsets.only(top: SizeProvider.instance.size(10)),
        child: Text( content, style: const TextStyle(
            fontFamily: TextProvider.familyNunitoSans,
            package: 'tiki_style',
           fontWeight: FontWeight.w500,
          color: ColorProvider.tikiBlue
    )));
  }

  Set<Factory<OneSequenceGestureRecognizer>> _gestureRecognizerFactorySet() {
    return {Factory(() => VerticalDragGestureRecognizer())};
  }
}
