import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
  const ChatScreen({super.key});
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<_Message> _messages = [];

  void _handleSendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(_Message(
          text: _messageController.text,
          isMine: true,
          timestamp: DateTime.now(),
        ));
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _messages[index].isMine
                          ? SizedBox.shrink()
                          : Text(
                        'Partner',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: _messages[index].isMine ? Colors.blue : Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _messages[index].text,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '${_messages[index].timestamp.hour}:${_messages[index].timestamp.minute}',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      _messages[index].isMine
                          ? Text(
                        'Me',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                          : SizedBox.shrink(),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: _handleSendMessage,
                  tooltip: 'Send',
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Message {
  final String text;
  final bool isMine;
  final DateTime timestamp;

  _Message({required this.text, required this.isMine, required this.timestamp});
}