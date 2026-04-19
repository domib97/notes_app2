import '../models/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();
  Future<void> addNote(Note note);
  Future<void> removeNote(String id);
  Future<void> updateNote(Note note);
  
  // Future-proofing for Voting / Cardano interactions
  Future<void> voteNote(String id, int change);
}
