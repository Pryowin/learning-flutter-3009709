import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  ChatInput({Key? key}) : super(key: key);

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print("Chat Message : ${chatMessageController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
          Expanded(
              child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            controller: chatMessageController,
            textCapitalization: TextCapitalization.sentences,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                hintText: "Type your message",
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: InputBorder.none),
          )),
          IconButton(
            onPressed: onSendButtonPressed,
            icon: const Icon(Icons.send),
            color: Colors.white,
          )
        ],
      ),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    );
  }
}
