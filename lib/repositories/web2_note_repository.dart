import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/note.dart';
import 'note_repository.dart';

class Web2NoteRepository implements NoteRepository {
// 10.0.2.2 ist die IP-Adresse deines PCs vom Android-Emulator aus gesehen
  final String _baseUrl = "http://127.0.0.1:8000";
  final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  @override
  Future<List<Note>> getNotes() async {
    final response = await http.get(Uri.parse('$_baseUrl/notes'));

    if (response.statusCode == 200) {
      final List<dynamic> notesJson = json.decode(utf8.decode(response.bodyBytes));
      return notesJson.map((json) => Note.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load notes from web2 backend');
    }
  }

    @override
    Future<void> addNote(Note note) async {
        final response = await http.post(
           Uri.parse('$_baseUrl/notes'),
          headers: _headers,
          // WICHTIG: Die ID muss hier mitgesendet werden!
          body: json.encode({
            ...note.toJson(),
             'id': note.id,
           }),
         );


    if (response.statusCode != 201) {
      throw Exception('Failed to add note via web2 backend');
    }
  }

  @override
  Future<void> removeNote(String id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/notes/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to remove note via web2 backend');
    }
  }

  @override
  Future<void> updateNote(Note note) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/notes/${note.id}'),
      headers: _headers,
      body: json.encode(note.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update note via web2 backend');
    }
  }

  @override
  Future<void> voteNote(String id, int change) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/notes/$id/vote'),
      headers: _headers,
      body: json.encode({'change': change}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to vote on note via web2 backend');
    }
  }
}