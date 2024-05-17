import 'package:flutter/material.dart';

class ListDataItems {
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

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ListDataItems item = ListDataItems();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: item.monthItems.length,
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.monthItems[index]),
            const SizedBox(
              width: 10.0,
            ),
          ],
        );
      },
    );
  }
}