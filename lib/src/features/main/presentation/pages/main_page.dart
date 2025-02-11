import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:kepotalk/src/core/data/datasources/theme_provider.dart';
import 'package:kepotalk/src/core/theme/app_font.dart';
import 'package:kepotalk/src/features/chatbot/presentation/pages/chat_page.dart';
import 'package:kepotalk/src/features/main/widgets/history_item_button.dart';
import 'package:kepotalk/src/features/main/widgets/menu_button_widget.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isRotated = false;
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //**
                // NAVBAR
                // */
                _navbar(isRotated, isDarkMode, themeProvider),
                //**
                // Title Section
                // */
                const SizedBox(height: 60),
                const Text(
                  "How may I help you today?",
                  style: AppFont.generalSansHeadingThin,
                ),
                const SizedBox(height: 30),
                _menu(context),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("History"),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All",
                          style: AppFont.generalSans16.copyWith(
                              color: isDarkMode ? Colors.white : Colors.black),
                        )),
                  ],
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const HistoryItemButton();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _menu(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          MenuButtonWidget(
            width: (MediaQuery.of(context).size.width / 2) - 10,
            color: Colors.blue[300],
            icon: Icons.mic,
            label: "Talk With KepoTalk",
            onPressed: () {
              debugPrint("Talk With Kepotalk");
            },
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraint) {
                return Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      MenuButtonWidget(
                        height: (constraint.maxHeight / 2) - 5,
                        color: Colors.red[300],
                        icon: Icons.message,
                        label: "Chat with Bot",
                        onPressed: () {
                          getx.Get.to(
                            const ChatPage(),
                            transition: getx.Transition.rightToLeftWithFade,
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      MenuButtonWidget(
                        height: (constraint.maxHeight / 2) - 5,
                        color: Colors.purple[300],
                        icon: Icons.image,
                        label: "Search by Image",
                        onPressed: () {
                          debugPrint("search With Kepotalk");
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _navbar(bool isRotated, bool isDarkMode, ThemeProvider themeProvider) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedRotation(
            turns: isRotated ? 1 : 0,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutCirc,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(turns: animation, child: child);
              },
              child: IconButton(
                key: ValueKey<bool>(isDarkMode),
                onPressed: () async {
                  final savedTheme = await themeProvider.getThemePreferences();
                  themeProvider.toggleTheme(!savedTheme);
                },
                icon: Icon(isDarkMode ? Icons.nightlight_round : Icons.sunny),
                iconSize: 20,
              ),
            ),
          ),
          const Text(
            "Hi ELqi",
          ),
          const CircleAvatar(
            child: Text("E"),
          ),
        ],
      ),
    );
  }
}
