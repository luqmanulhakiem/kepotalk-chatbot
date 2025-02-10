import 'package:flutter/material.dart';
import 'package:kepotalk/src/core/theme/app_theme.dart';
import 'package:kepotalk/src/features/main/presentation/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KepoTalk',
      theme: AppTheme.darkThemeMode,
      home: const MainPage(),
    );
  }
}
