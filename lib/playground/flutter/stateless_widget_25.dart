import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const paramTitle = 'Mein Titel';
    const paramName = 'Mein Name';
    return MaterialApp(
      title: paramTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(paramTitle),
        ),
        body: const MyTextWidget(name: paramName, title: paramTitle),
      ),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  final String title;
  final String name;
  const MyTextWidget({Key? key, required this.title, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$title $name"),
    );
  }
}
