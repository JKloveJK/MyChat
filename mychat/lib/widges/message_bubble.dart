// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mychat/models/message_model.dart';
import 'package:mychat/utils/time_utils.dart';
import 'package:mychat/widges/avatar_widget.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isSent = message.type == MessageType.sent;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment:
            isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isSent) ...[
            AvatarWidget(imageUrl: message.avatarUrl ?? '', size: 30),
            SizedBox(width: 8),
          ],

          Flexible(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSent ? Colors.green : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isSent)
                    Text(
                      message.sender,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  Text(
                    message.content,
                    style: TextStyle(
                      color: isSent ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    TimeUtils.formatTime(message.timestamp),
                    style: TextStyle(
                      color: isSent ? Colors.white70 : Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isSent) ...[
            SizedBox(width: 8),
            AvatarWidget(imageUrl: message.avatarUrl ?? '', size: 30),
            
          ],
        ],
      ),
    );
  }
}
