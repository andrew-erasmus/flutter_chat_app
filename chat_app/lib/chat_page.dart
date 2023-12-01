import 'dart:convert';

import 'package:chat_app/repo/image_repository.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    rootBundle.loadString('assets/mock_messages.json').then((response) {
      final List<dynamic> decodedList = jsonDecode(response) as List;
      final List<ChatMessageEntity> _chatMessages = decodedList.map((listItem) {
        return ChatMessageEntity.fromJSON(listItem);
      }).toList();

      setState(() {
        _messages = _chatMessages;
      });
    }).then((_) => print('Done!'));
  }

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = context.watch<AuthService>().getUserName();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi ${username}!'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthService>().updateUserName("New name");
            },
            icon: Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () {
              context.read<AuthService>().logoutUser();
              Navigator.pushReplacementNamed(
                  context, '/'); //Always the home page that created in main
              print("Icon pressed");
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: _messages[index].author.userName ==
                                context.read<AuthService>().getUserName()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        entity: _messages[index]);
                  })),
          ChatInput(
            onSubmit: onMessageSent,
          ),
        ],
      ),
    );
  }
}
