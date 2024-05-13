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
        primarySwatch: Colors.green,
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
                final isMine = _messages[index].isMine;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      if (!isMine)
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Text(
                            'Partner:',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      Column(
                        crossAxisAlignment: isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: isMine ? Colors.blue : Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            child: Text(
                              _messages[index].text,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${_messages[index].timestamp.hour.toString().padLeft(2, '0')}:${_messages[index].timestamp.minute.toString().padLeft(2, '0')}',
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ],
                      ),
                      if (isMine)
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            'Me',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
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