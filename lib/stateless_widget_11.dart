import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Expanded-Widget';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: const MyExpandedWidget(),
      ),
    );
  }
}

class MyExpandedWidget extends StatelessWidget {
  const MyExpandedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          child: Placeholder(
            fallbackHeight: 400,
            strokeWidth: 10,
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Placeholder(
            fallbackHeight: 400,
            strokeWidth: 10,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Placeholder(
            fallbackHeight: 400,
            strokeWidth: 10,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
