class ChatMessage {
  String message;
  bool isMe;
  String time;
  bool isVoice;

  ChatMessage({
    required this.message,
    required this.isMe,
    required this.time,
    this.isVoice = false,
  });
}
