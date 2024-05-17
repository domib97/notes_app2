import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter und Dart Kochbuch Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          labelStyle: TextStyle(color: Colors.grey), // Farbe für Text
        ),
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
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('MyAwesomeTabBar'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home, color: Colors.white),
                  child: Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Tab(
                  icon: Icon(Icons.account_balance, color: Colors.white),
                  child: Text('Konto', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Tab(
                  icon: Icon(Icons.calculate, color: Colors.white),
                  child: Text('Umsätze', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Tab(
                  icon: Icon(Icons.credit_score, color: Colors.white),
                  child: Text('Karte', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SizedBox(
                child: Center(
                  child: Text('Homepage Tab 1'),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Text('Konto-Seite Tab 2'),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Text('Umsatz-Seite Tab 3'),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Text('Karten-Seite Tab 4'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}