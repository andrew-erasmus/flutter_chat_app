import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Hi Andrew!"),
        actions: [
          IconButton(
            onPressed: () {
              print("Icon pressed");
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ChatBubble(
                    alignment: Alignment.centerLeft,
                    message: "Hello this is Andrew!"),
                ChatBubble(
                    alignment: Alignment.centerRight, message: "Hi Andrew!")
              ],
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
