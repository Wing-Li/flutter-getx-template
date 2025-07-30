import 'package:flutter/material.dart';
import 'package:flutter_getx_template/widget/layout/my_scaffold.dart';
import 'package:get/get.dart';

import 'chat_logic.dart';
import 'chat_state.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final ChatLogic logic = Get.put(ChatLogic());
  final ChatState state = Get.find<ChatLogic>().state;

  @override
  Widget build(BuildContext context) {
    return MyHomeScaffold(
      title: "Chat",
      body: Center(
        child: Text("Chat"),
      ),
    );
  }
}
