import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final Alignment alignment;
  const ChatBubble({Key? key, required this.message, required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(50),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const Image(
                image: NetworkImage(
                    'https://media.licdn.com/dms/image/v2/D4E03AQGeuFgUOcH2BA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1719344633781?e=1729728000&v=beta&t=vZVg_ajzOYWb_rsTas5cU-r-AzANcQ-LhI-MFAZmRIw')),
          ],
        ),
      ),
    );
  }
}
