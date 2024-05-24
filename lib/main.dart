import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pages/note_page.dart';
import 'pages/chat_page.dart';
import 'pages/inbox_page.dart';
import 'pages/settings_page.dart';
import 'firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'constants.dart';
import 'pages/splash_page.dart';

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
    const SplashPage(),
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
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidMessage),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidBell),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gear),
              label: 'Settings',
            ),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 9.0,
          showUnselectedLabels: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
