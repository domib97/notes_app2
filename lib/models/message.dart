class Message {
  Message({
    required this.id,
    required this.profileId,
    required this.roomId, // Added roomId
    required this.content,
    required this.createdAt,
    required this.isMine,
  });

  /// ID of the message
  final String id;

  /// ID of the user who posted the message
  final String profileId;

  /// ID of the room where the message was posted
  final String roomId; // Added roomId

  /// Text content of the message
  final String content;

  /// Date and time when the message was created
  final DateTime createdAt;

  /// Whether the message is sent by the user or not.
  final bool isMine;

  Message.fromMap({
    required Map<String, dynamic> map,
    required String myUserId,
  })  : id = map['id'],
        profileId = map['profile_id'],
        roomId = map['room_id'], // Added roomId
        content = map['content'],
        createdAt = DateTime.parse(map['created_at']),
        isMine = myUserId == map['profile_id'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'profile_id': profileId,
      'room_id': roomId, // Added roomId
      'content': content,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
