import 'package:flutter/material.dart';

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
            TabBar(
              tabs: [
                Tab(text: 'A'),
                Tab(text: 'B'),
                Tab(text: 'C'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Content of A')),
                  Center(child: Text('Content of B')),
                  Center(child: Text('Content of C')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
