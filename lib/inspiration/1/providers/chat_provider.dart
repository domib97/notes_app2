import 'package:flutter/material.dart';

import '../models/chat_model.dart';

class chatProvider extends ChangeNotifier {
  ChatModel? _chatData;

  set chatData(ChatModel? chat) {
    _chatData = chat;
    notifyListeners();
  }

  ChatModel? get chatData => _chatData;
}
