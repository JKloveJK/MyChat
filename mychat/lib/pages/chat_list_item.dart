// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:mychat/models/message_model.dart';
import 'package:mychat/utils/time_utils.dart';
import 'package:mychat/widges/avatar_widget.dart';

class ChatListItem extends StatelessWidget {
  final Message message;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final bool isPinned;
  int unreadCount;
  final VoidCallback? onMarkUnread;
  final VoidCallback? onDelete;

  ChatListItem({
    super.key,
    required this.message,
    required this.onTap,
    this.onLongPress,
    this.isPinned = false,
    this.unreadCount = 0,
    this.onMarkUnread,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              print('asdadadadasdasdasdasdasd');
              unreadCount = 1;
              onMarkUnread?.call();
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.mark_chat_unread,
            label: '未读',
            autoClose: true,
          ),
          SlidableAction(
            onPressed: (_) => onDelete?.call(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: '删除',
            autoClose: true,
          ),
        ],
      ),
      child: Container(
        color: isPinned ? Colors.grey[100] : Colors.white,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // 头像部分
                Stack(
                  children: [
                    AvatarWidget(imageUrl: message.avatarUrl ?? ''),
                    if (unreadCount > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            unreadCount > 99 ? '99+' : '$unreadCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                // 消息内容区域
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // 联系人名称
                          Expanded(
                            child: Text(
                              message.sender,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    unreadCount > 0
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            ),
                          ),
                          // 时间和更多按钮
                          Text(
                            TimeUtils.formatTime(message.timestamp),
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight:
                                  unreadCount > 0
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_vert, size: 20),
                            onPressed: () {
                              // 处理更多操作
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // 消息预览和状态
                      Row(
                        children: [
                          // 消息发送状态指示
                          if (message.type == MessageType.sent)
                            Icon(
                              Icons.check_circle,
                              color:
                                  message.status == MessageStatus.failed
                                      ? Colors.red
                                      : Colors.grey,
                              size: 16,
                            ),
                          const SizedBox(width: 4),
                          // 消息内容
                          Expanded(
                            child: Text(
                              message.content,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight:
                                    unreadCount > 0
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
