  class ChatUser {
    String id;
    String name;
    String lastMessage;
    String time;
    int unreadCount;
    String image;

    ChatUser({
      required this.id,
      required this.name,
      required this.lastMessage,
      required this.time,
      required this.unreadCount,
      required this.image,
    });
  }
