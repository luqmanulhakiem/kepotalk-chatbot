import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kepotalk/src/features/chatbot/data/repository/gemini_repository_impl.dart';

part 'gemini_event.dart';
part 'gemini_state.dart';

class GeminiBloc extends Bloc<GeminiEvent, GeminiState> {
  final GeminiRepositoryImpl repository;
  GeminiBloc({required this.repository}) : super(GeminiInitial()) {
    on<GeminiTeks>((event, emit) async {
      Future.delayed(const Duration(seconds: 2));
      emit(GeminiLoading());
      Future.delayed(const Duration(seconds: 5));
      try {
        final resp = await repository.geminiTeks(event.keyword);
        emit(GeminiLoaded(response: resp));
      } catch (e) {
        emit(GeminiFailure(error: e.toString()));
      }
    });
  }
}
