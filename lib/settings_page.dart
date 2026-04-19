import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  @override

  State<SettingsPage> createState() => _SettingsPageState();
  const SettingsPage({super.key});
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notificationsEnabled = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: _darkMode,
              activeThumbColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              activeThumbColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Language'),
            subtitle: const Text('English'),
            trailing: const FaIcon(FontAwesomeIcons.angleRight),
            onTap: () {
            // Navigate to language selection page
            },
          ),
          ListTile(
            title: const Text('About'),
            subtitle: const Text('Version 1.0'),
            trailing: const FaIcon(FontAwesomeIcons.circleInfo),
            onTap: () {
            // Show about dialog
            },
          ),
        ],
      ),
    );
  }
}
