import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'providers/note_provider.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _darkMode = false;
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final useCardano = ref.watch(useCardanoBackendProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Allgemein",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
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
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Web3 & Blockchain",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          SwitchListTile(
            title: const Text('Cardano Backend nutzen'),
            subtitle: Text(useCardano 
              ? "Aktiv: Aiken Smart Contract" 
              : "Inaktiv: Lokale Simulation"),
            secondary: const FaIcon(FontAwesomeIcons.ethereum), // Ethereum Icon als Platzhalter für Crypto
            value: useCardano,
            activeThumbColor: Colors.blueAccent,
            onChanged: (value) {
              ref.read(useCardanoBackendProvider.notifier).toggle(value);
            },
          ),
          const Divider(),
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
            subtitle: const Text('Version 0.1 - Prod'),
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
