import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Demo Column-Widget';

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
      appBar: AppBar(title: const Text('Column-Beispiel')),
      body: _buildColumnWidget(),
    );
  }

  Widget _buildColumnWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          const Center(
            child: Text(
              "Top 5 Sprachen 2022",
              style: TextStyle(fontSize: 30, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              const SizedBox(
                width: 100.0,
                child: Text("Englisch"),
              ),
              Container(
                width: 600.0,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    "1,3 Milliarden",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const SizedBox(
                width: 100.0,
                child: Text("Mandarin"),
              ),
              Container(
                width: 550.0,
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    "1 Milliarde",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const SizedBox(
                width: 100.0,
                child: Text("Hindi"),
              ),
              Container(
                width: 300.0,
                color: Colors.pink,
                child: const Center(
                  child: Text(
                    "600 Millionen",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const SizedBox(
                width: 100.0,
                child: Text("Spanisch"),
              ),
              Container(
                width: 280.0,
                color: Colors.cyan,
                child: const Center(
                  child: Text(
                    "540 Millionen",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const SizedBox(
                width: 100.0,
                child: Text("Arabisch"),
              ),
              Container(
                width: 250.0,
                color: Colors.purple,
                child: const Center(
                  child: Text(
                    "310 Millionen",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
