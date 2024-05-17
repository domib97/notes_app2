import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'LayoutBuilder';

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
      appBar: AppBar(title: const Text('LayoutBuilder-Beispiel')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Abfrage der Breite
          if (constraints.maxWidth > 800) {
            return _buildTripleContainers();
          } else if (constraints.maxWidth > 600 && constraints.maxWidth <= 800) {
            return _buildDoubleContainers();
          } else {
            return _buildSingleContainer();
          }
        },
      ),
    );
  }

  Widget _buildSingleContainer() {
    return Center(
      child: Container(
        height: 400.0,
        width: 100.0,
        color: Colors.red,
      ),
    );
  }

  Widget _buildDoubleContainers() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 400.0,
            width: 100.0,
            color: Colors.yellow,
          ),
          Container(
            height: 400.0,
            width: 100.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }

  Widget _buildTripleContainers() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 400.0,
            width: 100.0,
            color: Colors.green,
          ),
          Container(
            height: 400.0,
            width: 100.0,
            color: Colors.green,
          ),
          Container(
            height: 400.0,
            width: 100.0,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
