import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('Inbox', style: TextStyle(fontSize: 24)).animate().fade().scale().tint(color: Colors.pink),
      ),
    );
  }
}
