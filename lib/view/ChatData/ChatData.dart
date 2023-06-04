import 'package:flutter/material.dart';



class ChatData extends StatefulWidget {
  const ChatData({Key? key, required  this.chatName}) : super(key: key);
  final String chatName;
  @override
  State<ChatData> createState() => _ChatDataState();
}

class _ChatDataState extends State<ChatData> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          // args,
          widget.chatName
        ),
      ),
    );
  }
}
