import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<String> items = [
    'Januar',
    'Februar',
    'März',
    'April',
    'Mai',
    'Juni',
    'Juli',
    'August',
    'September',
    'Oktober',
    'November',
    'Dezember'
  ];

  @override
  Widget build(BuildContext context) {
    const title = 'MyAwesomeApp';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return MyListView(items[index]);
          },
        ),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyDetails(title),
          ),
        );
      },
    );
  }
}

class MyDetails extends StatelessWidget {
  const MyDetails(this.itemTitle, {Key? key}) : super(key: key);

  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    const title = 'Detail-Seite';
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 338.0,
                width: 800.0,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(itemTitle),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}