import 'package:flutter/material.dart';
import 'package:kepotalk/src/core/enums/history_type_enum.dart';

class HistoryIconConverter {
  static Icon convert(HistoryTypeEnum type) {
    switch (type) {
      case HistoryTypeEnum.talk:
        return const Icon(
          Icons.mic,
          color: Colors.white,
        );
      case HistoryTypeEnum.chat:
        return const Icon(
          Icons.message,
          color: Colors.white,
        );
      case HistoryTypeEnum.image:
        return const Icon(
          Icons.image,
          color: Colors.white,
        );
      default:
        return const Icon(
          Icons.mic,
          color: Colors.white,
        );
    }
  }
}
