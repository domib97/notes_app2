import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inbox',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: InboxPage(),
    );
  }
}

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
  const InboxPage({super.key});
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            const TabBar(
              indicatorColor: Colors.green,
              labelColor: Colors.green,
              tabs: [
                Tab(text: 'A'),
                Tab(text: 'B'),
                Tab(text: 'C'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: const Text('Content A', style: TextStyle(fontSize: 24)).animate().fade().scale().tint(color: Colors.pink)),
                  Center(child: const Text('Content B', style: TextStyle(fontSize: 24)).animate().fade().scale().tint(color: Colors.cyanAccent)),
                  Center(child: const Text('Content C', style: TextStyle(fontSize: 24)).animate().fade().scale().tint(color: Colors.greenAccent)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
