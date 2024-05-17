import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'MyAwesomeApp';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: const MyListView(),
      ),
    );
  }
}

class ListViewData {
  final List<String> monthItems = [
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
    'Dezember',
  ];
}

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ListViewData items = ListViewData();
    return ListView.builder(
      itemCount: items.monthItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items.monthItems[index]),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Sie haben ${items.monthItems[index]} ausgewählt'),
              ),
            );
          },
        );
      },
    );
  }
}