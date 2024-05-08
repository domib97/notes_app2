import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'note_page.dart';
import 'chat_page.dart';
import 'inbox.dart';
import 'settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = [
    NotePage(),
    SearchPage(),
    NotificationsPage(),
    SettingsPage(),
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
