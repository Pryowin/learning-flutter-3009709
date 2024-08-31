import 'package:flutter/material.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, $username'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/');
              },
              icon: const Icon(Icons.logout))
        ],
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
          ChatInput()
        ],
      ),
    );
  }
}
