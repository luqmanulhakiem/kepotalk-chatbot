part of 'gemini_bloc.dart';

@immutable
sealed class GeminiState {}

final class GeminiInitial extends GeminiState {}

final class GeminiLoading extends GeminiState {}

final class GeminiLoaded extends GeminiState {
  final String response;

  GeminiLoaded({required this.response});
}

final class GeminiFailure extends GeminiState {
  final String error;

  GeminiFailure({required this.error});
}
