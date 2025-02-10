import 'package:flutter/material.dart';
import 'package:kepotalk/src/core/data/datasources/theme_provider.dart';
import 'package:kepotalk/src/core/theme/app_font.dart';
import 'package:provider/provider.dart';

class HistoryItemButton extends StatefulWidget {
  const HistoryItemButton({
    super.key,
  });

  @override
  State<HistoryItemButton> createState() => _HistoryItemButtonState();
}

class _HistoryItemButtonState extends State<HistoryItemButton> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: themeProvider.themeMode == ThemeMode.dark
            ? Colors.white10
            : Colors.black12,
        borderRadius: BorderRadius.circular(80),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[300],
            child: const Icon(
              Icons.mic,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraint) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  width: constraint.maxWidth,
                  child: const Text(
                    "Lorem ipsum sit amet dolor adlskadalksndalk",
                    style: AppFont.generalSans16,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
          ),
          IconButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.transparent),
            ),
            onPressed: () {
              //
            },
            icon: Icon(
              Icons.more_vert,
              color: themeProvider.themeMode == ThemeMode.dark
                  ? Colors.white
                  : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
