// models/message.dart
class Message {
  final String finalContent;
  final bool isSentByUser;
  bool hasAudio;

  Message({
    required this.finalContent,
    required this.isSentByUser,
    this.hasAudio = false,
  });
}
