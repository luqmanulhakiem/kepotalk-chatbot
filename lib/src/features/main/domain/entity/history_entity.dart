import 'package:kepotalk/src/core/enums/history_type_enum.dart';

class HistoryEntity {
  final String lastMessage;
  final HistoryTypeEnum type;

  HistoryEntity({required this.lastMessage, required this.type});
}
