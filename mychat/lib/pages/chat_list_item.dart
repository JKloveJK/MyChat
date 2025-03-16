// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mychat/models/message_model.dart';
import 'package:mychat/utils/time_utils.dart';
import 'package:mychat/widges/avatar_widget.dart';

class ChatListItem extends StatelessWidget {
  final Message message;
  final VoidCallback onTap;

  const ChatListItem({
    super.key,
    required this.message,
    required this.onTap,
  });
  
   

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Avatarwidget(imageUrl: message.avatarUrl ?? ''),
      title: Text(message.sender),
      subtitle: Text(
        message.content,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          TimeUtils.formatTime(message.timestamp),
          style: TextStyle(color: Colors.grey),
        ),
        onTap: onTap,
    );
  }
  
}
