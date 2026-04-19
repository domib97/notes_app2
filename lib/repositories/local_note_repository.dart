import '../models/note.dart';
import 'note_repository.dart';

class LocalNoteRepository implements NoteRepository {
  final List<Note> _notes = [];

  @override
  Future<List<Note>> getNotes() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 200));
    return List.from(_notes);
  }

  @override
  Future<void> addNote(Note note) async {
    _notes.insert(0, note); // Add to top like a feed
  }

  @override
  Future<void> removeNote(String id) async {
    _notes.removeWhere((note) => note.id == id);
  }

  @override
  Future<void> updateNote(Note note) async {
    final index = _notes.indexWhere((n) => n.id == note.id);
    if (index != -1) {
      _notes[index] = note;
    }
  }

  @override
  Future<void> voteNote(String id, int change) async {
    final index = _notes.indexWhere((n) => n.id == id);
    if (index != -1) {
      final oldNote = _notes[index];
      // Future Cardano note:
      // Here you would generate a new EUTXO transaction representing the vote.
      // For now, we mutate the state locally.
      _notes[index] = oldNote.copyWith(karma: oldNote.karma + change);
    }
  }
}
