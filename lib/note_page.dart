import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'models/note.dart';
import 'providers/note_provider.dart';

class NotePage extends ConsumerStatefulWidget {
  const NotePage({super.key});

  @override
  ConsumerState<NotePage> createState() => _NotePageState();
}

class _NotePageState extends ConsumerState<NotePage> {
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
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (contentController.text.isNotEmpty && channelController.text.isNotEmpty) {
                  Navigator.pop(context, true);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    if (saved == true) {
      final newNote = Note(
        content: contentController.text,
        channel: channelController.text,
        color: _colors[_random.nextInt(_colors.length)],
        karma: 0,
      );
      ref.read(notesProvider.notifier).addNote(newNote);
    }
  }

  void incrementKarma(String id) {
    HapticFeedback.lightImpact(); // Vibcoating
    ref.read(notesProvider.notifier).voteNote(id, 1);
  }

  void decrementKarma(String id) {
    HapticFeedback.lightImpact(); // Vibcoating
    ref.read(notesProvider.notifier).voteNote(id, -1);
  }

  void _removeNote(String id) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm deletion'),
          content: const Text('Are you sure you want to delete ‘your’ Jodel?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );

    if (confirmed ?? false) {
      ref.read(notesProvider.notifier).removeNote(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final notesAsyncValue = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jodel 2.0'),
        centerTitle: true,
      ),
      body: notesAsyncValue.when(
        data: (notes) {
          if (notes.isEmpty) {
            return const Center(child: Text("No Jodels yet! Be the first."));
          }
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              final note = notes[index];
              return Card(
                color: note.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("@${note.channel}", style: const TextStyle(fontSize: 15, color: Colors.black)),
                      const SizedBox(width: 10),
                      Text(DateFormat('kk:mm:ss').format(note.timestamp), style: const TextStyle(fontSize: 13, color: Colors.black)),
                    ],
                  ),
                  subtitle: Text(note.content, style: const TextStyle(fontSize: 20, color: Colors.white)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.angleUp),
                        onPressed: () => incrementKarma(note.id),
                        color: Colors.black,
                      ),
                      Text('${note.karma}', style: const TextStyle(fontSize: 12, color: Colors.black)),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.angleDown),
                        onPressed: () => decrementKarma(note.id),
                        color: Colors.black,
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeNote(note.id),
                        color: Colors.red,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.green,
        backgroundColor: Colors.green,
        hoverColor: Colors.pink,
        onPressed: _showAddNoteDialog,
        tooltip: 'New Jodel',
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
