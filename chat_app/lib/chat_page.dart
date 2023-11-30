import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
        text: "Hi Andrew",
        id: '1',
        createdAt: 21531731237,
        author: Author(userName: "AE")),
    ChatMessageEntity(
        text: "Hi there",
        id: '2',
        createdAt: 34723487,
        author: Author(userName: "AE2")),
    ChatMessageEntity(
        text: "How are you today???",
        id: '3',
        createdAt: 33275428248,
        author: Author(userName: "AE"))
  ];
  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi ${username}!'),
        actions: [
          IconButton(
            onPressed: () {
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
                        alignment: _messages[index].author.userName == "AE2"
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        entity: _messages[index]);
                  })),
          ChatInput(),
        ],
      ),
    );
  }
}
