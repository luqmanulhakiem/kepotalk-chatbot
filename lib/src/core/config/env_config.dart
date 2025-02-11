import 'dart:convert';
import 'package:flutter/services.dart';

class EnvConfig {
  static Map<String, dynamic>? _config;

  static Future<void> loadEnv() async {
    final String response = await rootBundle.loadString('assets/env.json');
    _config = json.decode(response);
  }

  static String get geminiApiKey {
    if (_config == null) {
      throw Exception(
          "Environment variables not loaded. Call loadEnv() first.");
    }
    return _config!['GeminiApi'] ?? "";
  }
}
