import 'package:flutter/material.dart';

class CarItem {
  final String title;
  final String subtitle;
  final String url;

  CarItem({
    required this.title,
    required this.subtitle,
    required this.url,
  });
}

class ListDataItems {
  final List<CarItem> carItems = [
    CarItem(
      title: '911 Cabriolet',
      subtitle: '911 Carrera Cabriolet Porsche',
      url: 'https://oreil.ly/m3OXC',
    ),
    CarItem(
      title: '718 Spyder',
      subtitle: '718 Spyder Porsche',
      url: 'https://oreil.ly/hca-6',
    ),
    CarItem(
      title: '718 Boxster T',
      subtitle: '718 Boxster T Porsche',
      url: 'https://oreil.ly/Ws4EX',
    ),
    CarItem(
      title: 'Cayenne',
      subtitle: 'Cayenne S Porsche',
      url: 'https://oreil.ly/gwvnL',
    ),
  ];
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SliverList-Widget-Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter und Dart Kochbuch'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            leading: Icon(Icons.menu),
            title: Text('MyAwesomeApp'),
            expandedHeight: 300,
            collapsedHeight: 150,
            floating: false,
          ),
          MySliverList(),
        ],
      ),
    );
  }
}

class MySliverList extends StatelessWidget {
  MySliverList({Key? key}) : super(key: key);

  final ListDataItems item = ListDataItems();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(item.carItems[index].url),
          ),
          title: Text(item.carItems[index].title),
          subtitle: Text(item.carItems[index].subtitle),
        ),
        childCount: item.carItems.length,
      ),
    );
  }
}