import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
  const SettingsPage({super.key});
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notificationsEnabled = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, '/signin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: _darkMode,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Language'),
            subtitle: Text('English'),
            trailing: const FaIcon(FontAwesomeIcons.angleRight),
            onTap: () {
            },
          ),
          ListTile(
            title: Text('About'),
            subtitle: Text('Version 1.0'),
            trailing: const FaIcon(FontAwesomeIcons.circleInfo),
            onTap: () { //todo About
            },
          ),
          ListTile(
            title: Text('Sign Out'),
            trailing: Icon(Icons.logout),
            onTap: _signOut,
          ),
        ],
      ),
    );
  }
}