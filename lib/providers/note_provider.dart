import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note.dart';
import '../repositories/note_repository.dart';
import '../repositories/local_note_repository.dart';

// Dependency Injection: The Repository
final noteRepositoryProvider = Provider<NoteRepository>((ref) {
  return LocalNoteRepository();
});

// The Notifier handles the UI state representation of the notes list
class NoteListNotifier extends AsyncNotifier<List<Note>> {
  @override
  Future<List<Note>> build() async {
    final repository = ref.watch(noteRepositoryProvider);
    return repository.getNotes();
  }

  Future<void> addNote(Note note) async {
    final repository = ref.read(noteRepositoryProvider);
    
    // Optimistic Update
    final currentNotes = state.value ?? [];
    state = AsyncValue.data([note, ...currentNotes]);
    
    await repository.addNote(note);
  }

  Future<void> removeNote(String id) async {
    final repository = ref.read(noteRepositoryProvider);
    
    // Optimistic Update
    final currentNotes = state.value ?? [];
    state = AsyncValue.data(currentNotes.where((n) => n.id != id).toList());
    
    await repository.removeNote(id);
  }

  Future<void> voteNote(String id, int change) async {
    final repository = ref.read(noteRepositoryProvider);
    
    final currentNotes = state.value ?? [];
    final noteIndex = currentNotes.indexWhere((n) => n.id == id);
    
    if (noteIndex != -1) {
      final note = currentNotes[noteIndex];
      final updatedNotes = List<Note>.from(currentNotes);
      updatedNotes[noteIndex] = note.copyWith(karma: note.karma + change);
      
      // Optimistic update
      state = AsyncValue.data(updatedNotes);
      
      await repository.voteNote(id, change);
    }
  }
}

// The Provider to access the NoteListNotifier in the UI
final notesProvider = AsyncNotifierProvider<NoteListNotifier, List<Note>>(() {
  return NoteListNotifier();
});
