import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:kepotalk/src/core/config/env_config.dart';
import 'package:kepotalk/src/features/chatbot/domain/repository/gemini_repository.dart';

class GeminiRepositoryImpl implements GeminiRepository {
  @override
  Future<String> geminiTeks(String keyword) async {
    await EnvConfig.loadEnv();
    final apiKey = EnvConfig.geminiApiKey;
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(maxOutputTokens: 100),
    );
    final chat = model.startChat(history: [
      Content.text('Hello, I have 2 dogs in my house.'),
      Content.model(
          [TextPart('Great to meet you. What would you like to know?')])
    ]);
    final content = Content.text(keyword);
    final response = await chat.sendMessage(content);
    return response.text ?? "";
  }
}
