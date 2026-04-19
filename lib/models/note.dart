import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Note {
  final String id;
  final String content;
  final String channel;
  final DateTime timestamp;
  final Color color;
  final int karma;

  Note({
    String? id,
    required this.content,
    required this.channel,
    required this.color,
    this.karma = 0,
    DateTime? timestamp,
  })  : id = id ?? const Uuid().v4(),
        timestamp = timestamp ?? DateTime.now();

  Note copyWith({
    String? id,
    String? content,
    String? channel,
    DateTime? timestamp,
    Color? color,
    int? karma,
  }) {
    return Note(
      id: id ?? this.id,
      content: content ?? this.content,
      channel: channel ?? this.channel,
      timestamp: timestamp ?? this.timestamp,
      color: color ?? this.color,
      karma: karma ?? this.karma,
    );
  }

  /// Creates a Note from a JSON object.
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      content: json['content'],
      channel: json['channel'],
      // The API sends a string, so we parse it.
      timestamp: DateTime.parse(json['timestamp']),
      // The API sends an integer, so we create a Color from it.
      color: Color(json['color']),
      karma: json['karma'],
    );
  }

  /// Converts a Note into a JSON object.
  /// Note: The API generates the ID and timestamp, so they are not sent from the client.
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'channel': channel,
      // We send the integer value of the color.
      'color': color.value,
      'karma': karma,
    };
  }
}
