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
    Colors.amber,
    Colors.green,
    Colors.lightBlueAccent,
    Colors.orangeAccent,
    Colors.pink,

  ];
  final Random _random = Random();

  void _showAddNoteDialog() async {
    TextEditingController contentController = TextEditingController();
    TextEditingController channelController = TextEditingController();
    // Start with a random colour, the user can change it in the dialog.
    Color selectedColor = _colors[_random.nextInt(_colors.length)];

    final bool? saved = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        // StatefulBuilder so the colour selection can re-render inside the dialog.
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
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
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Colour', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  ),
                  const SizedBox(height: 8),
                  _ColorPicker(
                    colors: _colors,
                    selected: selectedColor,
                    onSelected: (color) {
                      HapticFeedback.selectionClick();
                      setDialogState(() => selectedColor = color);
                    },
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
      },
    );

    if (saved == true) {
      final newNote = Note(
        content: contentController.text,
        channel: channelController.text,
        color: selectedColor,
        karma: 0,
      );
      ref.read(notesProvider.notifier).addNote(newNote);
    }
  }

  void _showEditNoteDialog(Note note) async {
    final TextEditingController contentController = TextEditingController(text: note.content);
    final TextEditingController channelController = TextEditingController(text: note.channel);
    // Pre-select the note's current colour; fall back to a random one if it is
    // outside the palette (older notes may carry a colour we no longer offer).
    Color selectedColor = _colors.contains(note.color)
        ? note.color
        : _colors[_random.nextInt(_colors.length)];

    final bool? saved = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
            return AlertDialog(
              title: const Text('Edit Jodel'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
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
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Colour', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  ),
                  const SizedBox(height: 8),
                  _ColorPicker(
                    colors: _colors,
                    selected: selectedColor,
                    onSelected: (color) {
                      HapticFeedback.selectionClick();
                      setDialogState(() => selectedColor = color);
                    },
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
      },
    );

    if (saved == true) {
      final updated = note.copyWith(
        content: contentController.text,
        channel: channelController.text,
        color: selectedColor,
      );
      try {
        await ref.read(notesProvider.notifier).updateNote(updated);
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not update Jodel: $e')),
        );
      }
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
      try {
        await ref.read(notesProvider.notifier).removeNote(id);
      } catch (e) {
        // The provider already restored the note; just tell the user.
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not delete Jodel from backend: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final notesAsyncValue = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jodel 2'),
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
                      Text("@${note.channel}", style: const TextStyle(fontSize: 14, color: Colors.black)),
                      const SizedBox(width: 50),
                      Text(DateFormat('dd-MM-yy kk:mm:ss').format(note.timestamp), style: const TextStyle(fontSize: 13, color: Colors.black)),
                    ],
                  ),
                  subtitle: Text(note.content, style: const TextStyle(fontSize: 28, color: Colors.white)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.penToSquare),
                        onPressed: () => _showEditNoteDialog(note),
                        color: Colors.black,
                        tooltip: 'Edit',
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.angleUp),
                        onPressed: () => incrementKarma(note.id),
                        color: Colors.black,
                      ),
                      Text('${note.karma}', style: const TextStyle(fontSize: 21, color: Colors.white)),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.angleDown),
                        onPressed: () => decrementKarma(note.id),
                        color: Colors.black,
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeNote(note.id),
                        color: Colors.black,
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

/// A row of tappable colour swatches. The selected one gets a border and a check mark.
class _ColorPicker extends StatelessWidget {
  final List<Color> colors;
  final Color selected;
  final ValueChanged<Color> onSelected;

  const _ColorPicker({
    required this.colors,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final outline = Theme.of(context).colorScheme.onSurface;

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: colors.map((color) {
        final bool isSelected = color == selected;
        return GestureDetector(
          onTap: () => onSelected(color),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? outline : Colors.transparent,
                width: 3,
              ),
            ),
            child: isSelected
                ? const Icon(Icons.check, size: 20, color: Colors.white)
                : null,
          ),
        );
      }).toList(),
    );
  }
}
