import 'package:flutter/material.dart';
import 'package:zendesk_flutter/zendesk_flutter.dart';

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
    return TextButton(
        onPressed: () => ZendeskFlutter().show(context),
        child: const Text('Open Modal'));
  }

}
