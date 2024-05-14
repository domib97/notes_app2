import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'note_page.dart';
import 'chat_page.dart';
import 'inbox_page.dart';
import 'settings_page.dart';
import 'firebase_options.dart';
import 'sign_up_page.dart';
import 'sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
    const ChatScreen(),
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
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (snapshot.hasError) {
            return Scaffold(body: Center(child: Text('Something went wrong!')));
          }
          if (snapshot.hasData) {
            return Scaffold(
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
            );
          } else {
            return SignInPage();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => Scaffold(
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
        '/signup': (context) => SignUpPage(),
        '/signin': (context) => SignInPage(),
      },
    );
  }
}