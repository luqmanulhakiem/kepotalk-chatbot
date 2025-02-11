import 'package:flutter/material.dart';
import 'package:kepotalk/src/core/enums/history_type_enum.dart';

class HistoryColorConverter {
  static Color convert(HistoryTypeEnum type) {
    switch (type) {
      case HistoryTypeEnum.talk:
        return const Color.fromRGBO(100, 181, 246, 1);
      case HistoryTypeEnum.chat:
        return const Color.fromRGBO(229, 115, 115, 1);
      case HistoryTypeEnum.image:
        return const Color.fromRGBO(186, 104, 200, 1);
      default:
        return Colors.transparent;
    }
  }
}
