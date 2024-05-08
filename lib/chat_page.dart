import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Chats', style: TextStyle(fontSize: 24)).animate().fade().scale().tint(color: Colors.pink),
      ),
    );
  }
}
