import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String chatRoomId;
  final TextEditingController controller;
  final onSendMessage;
  const MessageWidget({
    Key? key,
    required this.chatRoomId,
    required this.controller,
    required this.onSendMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 10,
      width: size.width,
      alignment: Alignment.center,
      child: SizedBox(
        height: size.height / 12,
        width: size.width / 1.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height / 17,
              width: size.width / 1.3,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.photo),
                    ),
                    hintText: "Send Message",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: IconButton(
                  icon: const Icon(Icons.send), onPressed: () => onSendMessage),
            ),
          ],
        ),
      ),
    );
  }
}
