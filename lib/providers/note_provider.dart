import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note.dart';
import '../repositories/note_repository.dart';
import '../repositories/web2_note_repository.dart'; // Neu
import '../repositories/cardano_note_repository.dart';
import '../services/cardano_service.dart';

/// Die Instanz der JavaScript-Bridge
final cardanoServiceProvider = Provider<CardanoService>((ref) {
  return CardanoService();
});

/// Ein einfacher Schalter, um das Backend zu steuern.
class BackendNotifier extends Notifier<bool> {
  @override
  bool build() => false;
  void toggle(bool value) => state = value;
}

final useCardanoBackendProvider = NotifierProvider<BackendNotifier, bool>(BackendNotifier.new);

/// Dependency Injection: Der Repository-Wähler.
final noteRepositoryProvider = Provider<NoteRepository>((ref) {
  final useCardano = ref.watch(useCardanoBackendProvider);
  final cardanoService = ref.watch(cardanoServiceProvider);
  
  if (useCardano) {
    return CardanoNoteRepository(cardanoService);
  } else {
    // Standardmäßig das Web2-Backend verwenden
    return Web2NoteRepository();
  }
});

class NoteListNotifier extends AsyncNotifier<List<Note>> {
  @override
  Future<List<Note>> build() async {
    final repository = ref.watch(noteRepositoryProvider);
    return repository.getNotes();
  }

  Future<void> addNote(Note note) async {
    final repository = ref.read(noteRepositoryProvider);
    final currentNotes = state.value ?? [];
    state = AsyncValue.data([note, ...currentNotes]);
    await repository.addNote(note);
  }

  Future<void> removeNote(String id) async {
    final repository = ref.read(noteRepositoryProvider);
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
      state = AsyncValue.data(updatedNotes);
      await repository.voteNote(id, change);
    }
  }
}

final notesProvider = AsyncNotifierProvider<NoteListNotifier, List<Note>>(() {
  return NoteListNotifier();
});
