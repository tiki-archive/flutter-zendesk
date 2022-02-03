import 'package:flutter/material.dart';
import 'package:zendesk_flutter/zendesk_flutter.dart';
import 'package:zendesk_flutter/src/zendesk_flutter_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(child: OpenModal()),
      ),
    );
  }
}

class OpenModal extends StatelessWidget {

  const OpenModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ZendeskFlutterStyle style = ZendeskFlutterStyle(
      cardBackground: Colors.white,
      modalNavColor : const Color(0xFFF0F0F0),
      textColor : const Color(0xFF8D8D8D),
      accentColor : const Color(0xFF1C0000),
      fontFamily : 'NunitoSans',
      titleFont : 'Koara',
      subtitleFont : 'NunitoSans'
    );
    return TextButton(
        onPressed: () => ZendeskFlutter(style: style).show(context),
        child: const Text('Open Modal'));
  }

}
