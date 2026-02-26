import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../core/constant/styles.dart';
import '../modules/chat/controllers/chat_controller.dart';
import '../modules/chat/views/chat_messsge.dart';

void openChatBottomSheet(BuildContext context, ChatController controller) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Obx(
          () => ListView.builder(
            itemCount: controller.chatList.length,
            itemBuilder: (context, index) {
              final chat = controller.chatList[index];

              return Slidable(
                key: Key(chat.id),
                endActionPane: ActionPane(
                  motion: DrawerMotion(),
                  extentRatio: 0.4,
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        print("tap");
                        controller.archiveChat(index);
                      },
                      borderRadius: BorderRadius.circular(16),
                      backgroundColor: Color(0xFFECEDFF),
                      foregroundColor: Colors.blue,
                      icon: Icons.archive,
                    ),
                    SlidableAction(
                      onPressed: (context) async {
                        print("Message");
                        bool? confirm = await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (dialogContext) {
                            return AlertDialog(
                              title: Text("Delete Message?", style: Gil),
                              content: Text(
                                textAlign: TextAlign.center,
                                "Do you really want to delete this conversation?",
                                style: GilReg,
                              ),
                              icon: Image.asset(
                                "assets/image/delete.png",
                                height: 80,
                                width: 80,
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        print("tappad");
                                        Navigator.pop(
                                          dialogContext,
                                          false,
                                        ); // Cancel
                                      },
                                      child: Text("Cancel", style: GilRegu),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFE52030),
                                        minimumSize: Size(120, 44),

                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ), // border radius
                                        ),
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        print("Delete");
                                        Navigator.pop(dialogContext, true);
                                      },
                                      child: Text("Delete", style: GilRegul),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );

                        if (confirm == true) {
                          controller.deleteChat(index);
                        }
                      },

                      backgroundColor: Color(0xFFFFD2D7),
                      foregroundColor: Colors.red,
                      icon: Icons.delete,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ],
                ),

                child: ListTile(
                  onTap: () {
                    Get.to(() => ChatDetailView());
                  },
                  leading: CircleAvatar(
                    radius: 25,
                    child: ClipOval(
                      child: chat.image.isEmpty
                          ? Image.asset(
                              "assets/image/arjit.jpg",
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            )
                          : Image.network(
                              chat.image,
                              fit: BoxFit.cover,
                              width: 52,
                              height: 52,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  "assets/image/person_pic.jpg",
                                  fit: BoxFit.cover,
                                  width: 52,
                                  height: 52,
                                );
                              },
                            ),
                    ),
                  ),
                  title: Text(chat.name, style: PopReCarosMed),
                  subtitle: Text(chat.lastMessage, style: StdReg),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(chat.time, style: StdReg),
                      if (chat.unreadCount > 0)
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            chat.unreadCount.toString(),
                            style: StdRegu,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
