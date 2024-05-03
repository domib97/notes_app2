import 'package:flutter/material.dart';
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
  final DateTime timestamp;
  final Color color;

  Note(this.content, this.color) : timestamp = DateTime.now();
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
    TextEditingController controller = TextEditingController();
    final String? returnedText = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Jodel posten:'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(hintText: '#GoodVibesOnly'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Abbrechen'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  Navigator.pop(context, controller.text);
                }
              },
              child: const Text('Speichern'),
            ),
          ],
        );
      },
    );

    if (returnedText != null && returnedText.isNotEmpty) {
      setState(() {
        _notes
            .add(Note(returnedText, _colors[_random.nextInt(_colors.length)]));
      });
    }
  }

  void _removeNote(int index) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Löschen bestätigen'),
          content:
          const Text('Sicher, dass Sie "ihren" Jodel löschen möchten?'),
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
              leading: const Text('i'),
              title: Text(DateFormat('kk:mm:ss - dd.MM.yyyy')
                  .format(_notes[index].timestamp)),
              isThreeLine: true,
              subtitle: Text(_notes[index].content),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _removeNote(index),
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
        tooltip: 'neuer Jodel',
        child: const Icon(Icons.add),
      ),
    );
  }
}