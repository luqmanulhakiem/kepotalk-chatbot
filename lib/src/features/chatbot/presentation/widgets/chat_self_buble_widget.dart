import 'package:flutter/material.dart';
import 'package:kepotalk/src/core/theme/app_font.dart';

class ChatSelfBubleWidget extends StatelessWidget {
  final String message;
  const ChatSelfBubleWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width -
              (MediaQuery.of(context).size.width * 30 / 100),
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Text(
            message,
            style: AppFont.generalSans16,
          ),
        ),
      ],
    );
  }
}
