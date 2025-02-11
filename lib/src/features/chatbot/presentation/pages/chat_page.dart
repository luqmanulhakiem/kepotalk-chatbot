import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;
import 'package:kepotalk/src/core/data/datasources/theme_provider.dart';
import 'package:kepotalk/src/core/theme/app_font.dart';
import 'package:kepotalk/src/features/chatbot/domain/entity/chat_entity.dart';
import 'package:kepotalk/src/features/chatbot/presentation/blocs/gemini/gemini_bloc.dart';
import 'package:kepotalk/src/features/chatbot/presentation/widgets/chat_bot_buble_widget.dart';
import 'package:kepotalk/src/features/chatbot/presentation/widgets/chat_bot_loading_widget.dart';
import 'package:kepotalk/src/features/chatbot/presentation/widgets/chat_self_buble_widget.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatEntity> chatlist = [
    ChatEntity(message: "Halo Pengguna KepoTalk, Mau Kepo Apa Hari ini?"),
  ];
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ScrollController _scrollController = ScrollController();

  void getData(String keyword) {
    context.read<GeminiBloc>().add(GeminiTeks(keyword: keyword));
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    final TextEditingController chatController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _navbar(isDarkMode),
              const SizedBox(height: 10),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return BlocListener<GeminiBloc, GeminiState>(
                      listener: (context, state) {
                        if (state is GeminiLoading) {
                          isLoading.value = true;
                        } else if (state is GeminiLoaded) {
                          isLoading.value = false;

                          setState(() {
                            chatlist.add(ChatEntity(message: state.response));
                          });
                          _scrollToBottom();
                        } else {
                          isLoading.value = false;
                        }
                      },
                      child: SizedBox(
                        height: constraint.maxHeight,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            children: [
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: chatlist.length,
                                itemBuilder: (context, index) {
                                  final item = chatlist[index];

                                  if (!item.fromApi) {
                                    return ChatSelfBubleWidget(
                                      message: item.message,
                                    );
                                  }
                                  return ChatBotBubleWidget(
                                    message: item.message,
                                  );
                                },
                              ),
                              if (chatlist.isNotEmpty &&
                                  !chatlist.last.fromApi &&
                                  isLoading.value)
                                const ChatBotLoadingWidget()
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: chatController,
                      style: AppFont.generalSans12.copyWith(
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (chatController.text.isNotEmpty) {
                        debugPrint(chatController.text);
                        setState(() {
                          chatlist.add(ChatEntity(
                              message: chatController.text, fromApi: false));
                        });
                        getData(chatController.text);
                      }
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _navbar(bool isDarkMode) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            getx.Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        const Expanded(
          child: Center(child: Text("Kepo Chat")),
        ),
        IconButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.transparent)),
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}
