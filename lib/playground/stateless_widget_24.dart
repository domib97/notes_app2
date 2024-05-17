import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bottom Navigation Widget",
      home: MyBottomNavigationWidget(),
    );
  }
}

final List<Widget> _navigationPages = [
  const Center(child: Text('Seite: Home')),
  const Center(child: Text('Seite: News')),
  const Center(child: Text('Demo: Favoriten')),
  const Center(child: Text('Demo: Liste')),
];

class MyBottomNavigationWidget extends StatefulWidget {
  const MyBottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationWidget> createState() => _MyBottomNavigationWidgetState();
}

class _MyBottomNavigationWidgetState extends State<MyBottomNavigationWidget> {
  final appTitle = 'Bottom Navigation Widget';
  int _itemSelected = 0;

  void _bottomBarNavigation(int index) {
    setState(() {
      _itemSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: _navigationPages[_itemSelected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _itemSelected,
        onTap: _bottomBarNavigation,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoriten'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Liste'),
        ],
      ),
    );
  }
}
