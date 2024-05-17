import 'package:flutter/material.dart';
import 'package:notes_app2/playground/stateless_widget_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const _title = 'SizedBox-Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatelessWidget(),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SizedBox-Bsp')),
      body: _buildSizedBoxWidget(),
    );
  }

  Widget _buildSizedBoxWidget() {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 100,
            child: Card(
              color: Colors.yellow,
              child: Center(child: Text('Developer')),
            ),
          ),
          SizedBox(
            width: 300,
            height: 100,
            child: Card(
              color: Colors.cyanAccent,
              child: Center(child: Text('Flutter-Framework')),
            ),
          ),
          SizedBox(
            width: 400,
            height: 100,
            child: Card(
              color: Colors.blue,
              child: Center(child: Text('Dart-SDK')),
            ),
          ),
        ],
      ),
    );
  }
}