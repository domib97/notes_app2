import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String titleAppBar = 'Appbar-Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: titleAppBar,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: MyAppBar(title: titleAppBar),
        body: const Center(
          child: Text('Hello, world!'),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double sizeAppBar = 56.0;  // Standard height for an AppBar

  const MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(sizeAppBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.pink,
      elevation: 20.0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.settings),
      ),
    );
  }
}
