import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:kepotalk/src/core/data/datasources/theme_provider.dart';
import 'package:kepotalk/src/core/theme/app_theme.dart';
import 'package:kepotalk/src/features/chatbot/data/repository/gemini_repository_impl.dart';
import 'package:kepotalk/src/features/chatbot/presentation/blocs/gemini/gemini_bloc.dart';
import 'package:kepotalk/src/features/main/presentation/pages/main_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider = ThemeProvider();
  await Future.delayed(const Duration(milliseconds: 100)); // Ensure async load
  runApp(
    ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: DevicePreview(
        enabled: false,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GeminiBloc(repository: GeminiRepositoryImpl()),
        ),
      ],
      child: GetMaterialApp(
        title: 'KepoTalk',
        theme: AppTheme.lightThemeMode,
        darkTheme: AppTheme.darkThemeMode,
        themeMode: themeProvider.themeMode,
        home: const MainPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
