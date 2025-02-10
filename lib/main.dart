import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kepotalk/src/core/data/datasources/theme_provider.dart';
import 'package:kepotalk/src/core/theme/app_theme.dart';
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
        enabled: kDebugMode,
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

    return MaterialApp(
      title: 'Flutter Theme Switch',
      theme: AppTheme.lightThemeMode,
      darkTheme: AppTheme.darkThemeMode,
      themeMode: themeProvider.themeMode,
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
