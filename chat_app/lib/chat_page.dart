import 'package:flutter/material.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text('Hi, David'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: Column(
        children: [
          Flexible(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: index % 2 == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        message: 'Hello');
                  })),
          const ChatInput()
        ],
      ),
    );
  }
}
