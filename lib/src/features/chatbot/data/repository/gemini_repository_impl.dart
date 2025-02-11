import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kepotalk/src/core/config/env_config.dart';
import 'package:kepotalk/src/features/chatbot/domain/repository/gemini_repository.dart';

class GeminiRepositoryImpl implements GeminiRepository {
  @override
  Future<String> geminiTeks(String keyword) async {
    await EnvConfig.loadEnv();
    final apiKey = EnvConfig.geminiApiKey;
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    final content = [Content.text(keyword)];
    final response = await model.generateContent(content);
    return response.text ?? "";
  }
}
