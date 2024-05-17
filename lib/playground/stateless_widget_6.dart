import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Beispiel';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row-Beispiel')),
      body: _buildRowWidget(),
    );
  }

  Widget _buildRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 5,
          color: Colors.transparent,
        ),
        Expanded(
          child: Container(
            height: 50,
            width: 200,
            color: Colors.red,
            child: const Center(
              child: Text("50"),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 100,
            width: 200,
            color: Colors.green,
            child: const Center(
              child: Text("100"),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.orange,
            child: const Center(
              child: Text("200"),
            ),
          ),
        ),
        Container(
          width: 5,
          color: Colors.transparent,
        ),
      ],
    );
  }
}
