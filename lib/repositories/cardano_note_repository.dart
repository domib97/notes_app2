import '../models/note.dart';
import '../services/cardano_service.dart';
import 'note_repository.dart';

class CardanoNoteRepository implements NoteRepository {
  final CardanoService _cardanoService;

  CardanoNoteRepository(this._cardanoService);
  
  @override
  Future<List<Note>> getNotes() async {
    // Später: UTXOs von der Chain laden
    return [];
  }

  @override
  Future<void> addNote(Note note) async {
    // Ruft die JavaScript-Bridge auf
    await _cardanoService.postJodel(note.content, note.channel);
  }

  Future<void> simulateVote(String txHash, int change) async {
    await _cardanoService.simulateVote(txHash, change);
  }


  @override
  Future<void> removeNote(String id) async {
    print("CARDANO: Löschen erfordert Aiken-Berechtigung.");
  }

  @override
  Future<void> updateNote(Note note) async {
    // Update = Vote / Spend
  }

  @override
  Future<void> voteNote(String id, int change) async {
    // In der echten Chain brauchen wir den TxHash des Jodels, um ihn zu finden.
    // Wir nutzen hier die 'id' als Referenz.
    await _cardanoService.voteJodel(id, change);
  }
}
