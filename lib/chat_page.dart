import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chats',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  //_ChatScreenState createState() => _ChatScreenState();
  const ChatScreen({super.key});
}

