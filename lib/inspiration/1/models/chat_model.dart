class ChatModel {
  String sender;
  String message;

  ChatModel({
    required this.sender,
    required this.message,
  });

  factory ChatModel.fromJson(dynamic data) {
    return ChatModel(
      sender: data['sender'],
      message: data['message'],
    );
  }

  @override
  String toString() {
    return 'sender = $sender  , message = $message ';
  }
}
