import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: index % 2 == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        entity: ChatMessageEntity(
                          text: 'Hello this is Andrew!!!!',
                          id: '1234',
                          createdAt: DateTime.now().microsecondsSinceEpoch,
                          author: Author(userName: 'Andrew235'),
                        ));
                  })),
          ChatInput(),
        ],
      ),
    );
  }
}
