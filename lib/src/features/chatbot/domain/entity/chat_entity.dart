class ChatEntity {
  final String message;
  final num? chatGroupId;
  final bool fromApi;

  ChatEntity({
    required this.message,
    this.chatGroupId,
    this.fromApi = true,
  });

  factory ChatEntity.fromJson(Map<String, dynamic> json) {
    return ChatEntity(message: json["text"]);
  }
}
