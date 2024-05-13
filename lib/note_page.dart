import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jodel 2.0',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const NotePage(),
    );
  }
}

class Note {
  final String content;
  final String channel;
  final DateTime timestamp;
  final Color color;
  int karma;

  Note(this.content, this.channel, this.color, {this.karma = 0}) : timestamp = DateTime.now();
}

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final List<Note> _notes = [];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.cyan,
    Colors.orange,
  ];
  final Random _random = Random();

  void _showAddNoteDialog() async {
    TextEditingController contentController = TextEditingController();
    TextEditingController channelController = TextEditingController();

    final bool? saved = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Image.asset('assets/images/logo1.png'),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Limits the column's height expansion
            children: <Widget>[
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 60),
                child: TextField(
                  controller: channelController,
                  decoration: const InputDecoration(
                    hintText: '@Channel',
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 60),
                child: TextField(
                  controller: contentController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: '#GoodVibesOnly',
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Abbrechen'),
            ),
            TextButton(
              onPressed: () {
                if (contentController.text.isNotEmpty && channelController.text.isNotEmpty) {
                  Navigator.pop(context, true);
                }
              },
              child: const Text('Speichern'),
            ),
          ],
        );
      },
    );

    if (saved == true) {
      setState(() {
        _notes.add(
            Note(contentController.text, channelController.text, _colors[_random.nextInt(_colors.length)], karma: 0));
      });
    }
  }

  void incrementKarma(int index) {
    setState(() {
      _notes[index].karma++;
    });
  }

  void decrementKarma(int index) {
    setState(() {
      _notes[index].karma--;
    });
  }

  void _removeNote(int index) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Löschen bestätigen'),
          content: const Text('Sicher, dass Sie "ihren" Jodel löschen möchten?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Abbruch'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Löschen'),
            ),
          ],
        );
      },
    );

    if (confirmed ?? false) {
      setState(() {
        _notes.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jodel 2.0'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: _notes[index].color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              leading: Text(DateFormat('kk:mm:ss')
                  .format(_notes[index].timestamp), style: const TextStyle(fontSize: 10, color: Colors.black)),
              title: Text("@${_notes[index].channel}", style: const TextStyle(fontSize: 13, color: Colors.black)),
              subtitle: Text(_notes[index].content, style: const TextStyle(fontSize: 22, color: Colors.white)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.angleUp),
                    onPressed: () => incrementKarma(index),
                      color: Colors.black,
                  ),
                  Text('${_notes[index].karma}', style: const TextStyle(fontSize: 12, color: Colors.black)),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.angleDown),
                    onPressed: () => decrementKarma(index),
                    color: Colors.black,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeNote(index),
                    color: Colors.red,
                  ),
                ],
              ),
              onTap: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.green,
        backgroundColor: Colors.green,
        hoverColor: Colors.pink,
        onPressed: _showAddNoteDialog,
        tooltip: 'Neuer Jodel',
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
