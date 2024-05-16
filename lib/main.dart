import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'note_page.dart';
import 'chat_page.dart';
import 'inbox_page.dart';
import 'settings_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'constants.dart';
import 'splash_page.dart';

Future<void> main() async {
  await Supabase.initialize(
    // TODO: Replace credentials with your own
    url: 'https://ktastyizlblacjbjjpmr.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt0YXN0eWl6bGJsYWNqYmpqcG1yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU4MTEzNzQsImV4cCI6MjAzMTM4NzM3NH0.9pBaLiIDmJ-Vpp16Q5ssyJCDcD8nYLJaSpT3qtcLyt4',
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = [
    const NotePage(),
    const ChatPage(),
    const InboxPage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotesApp2',
      theme: ThemeData.light(),
      home: const SplashPage(), // Set SplashPage as the initial route
      routes: {
        '/note': (context) => const NotePage(),
        '/chat': (context) => const ChatPage(),
        '/inbox': (context) => const InboxPage(),
        '/settings': (context) => const SettingsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}