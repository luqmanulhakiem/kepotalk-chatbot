import 'package:flutter/material.dart';
import 'package:kepotalk/src/features/chatbot/presentation/widgets/three_dot_loading_widget.dart';

class ChatBotLoadingWidget extends StatelessWidget {
  const ChatBotLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CircleAvatar(
          child: Text("K"),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 20),
          width: 80,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: const ThreeDotLoading(),
        ),
      ],
    );
  }
}
