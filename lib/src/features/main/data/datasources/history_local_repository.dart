import 'package:kepotalk/src/core/enums/history_type_enum.dart';
import 'package:kepotalk/src/features/main/domain/entity/history_entity.dart';

class HistoryLocalRepository {
  List<HistoryEntity> getDummyHistory() {
    return [
      HistoryEntity(
          lastMessage: "Help me calculate my math task",
          type: HistoryTypeEnum.chat),
      HistoryEntity(
          lastMessage: "Do u know the song by this lyrics it's perfecttt",
          type: HistoryTypeEnum.talk),
      HistoryEntity(
          lastMessage: "Describe 2 different from 3 photo",
          type: HistoryTypeEnum.image),
    ];
  }
}
