part of 'gemini_bloc.dart';

@immutable
sealed class GeminiEvent {}

final class GeminiTeks extends GeminiEvent {
  final String keyword;

  GeminiTeks({required this.keyword});
}
