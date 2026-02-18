import 'package:flutter/material.dart';

import '../Model/story_model.dart';
import '../core/constant/styles.dart';

class StatusSection extends StatelessWidget {
  StatusSection({super.key});

  final List<StatusUser> users = [
    StatusUser(
      name: "Adil",
      imageUrl:
          "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150",
      hasUnseenStory: true,
    ),
    StatusUser(
      name: "Marina ",
      imageUrl:
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150",
      hasUnseenStory: true,
    ),
    StatusUser(
      name: "Dean",
      imageUrl:
          "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150",
      hasUnseenStory: true,
    ),
    StatusUser(
      name: "Max",
      imageUrl:
          "https://images.unsplash.com/photo-1552058544-f2b84fbe8308?w=150",
      hasUnseenStory: false,
    ),
    // Add more users here...
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFF3C006B),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MyStatusWidget(),
            ...users.map(
              (user) => Padding(
                padding: EdgeInsets.only(right: 5),
                child: _StatusAvatar(
                  name: user.name,
                  imageUrl: user.imageUrl,
                  hasUnseenStory: user.hasUnseenStory,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── My Status Widget (with green + badge) ───────────────────────────
class _MyStatusWidget extends StatelessWidget {
  const _MyStatusWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add, size: 32, color: Colors.grey),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: const Center(
                    child: Text(
                      "+",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            "My status",
            style: PopReCaros,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// ── Single User Status Avatar ───────────────────────────────────────
class _StatusAvatar extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool hasUnseenStory;

  const _StatusAvatar({
    required this.name,
    required this.imageUrl,
    required this.hasUnseenStory,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: hasUnseenStory
                  ? LinearGradient(
                      colors: [Colors.purple, Colors.orange, Colors.red],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: !hasUnseenStory ? Colors.grey.shade300 : null,
            ),
            child: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          SizedBox(height: 6),
          Text(
            name,
            style: PopReCaros,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
