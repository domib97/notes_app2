import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InboxPage extends StatefulWidget {
  @override
  State<InboxPage> createState() => _InboxPageState();
  const InboxPage({super.key});
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
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
                  Center(child: const Text('Regeln:\n1. \n2. \n', style: TextStyle(fontSize: 24)).animate().fade().scale().tint(color: Colors.pink)),
                  Center(child: const Text('zK-Altersverifikation', style: TextStyle(fontSize: 24)).animate().fade().scale().tint(color: Colors.cyanAccent)),
                  Center(child: const Text('Karma-Store', style: TextStyle(fontSize: 24)).animate().fade().scale().tint(color: Colors.greenAccent)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
