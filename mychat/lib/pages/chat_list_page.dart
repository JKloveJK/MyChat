import 'package:flutter/material.dart';
import 'package:mychat/models/message_model.dart';
import 'package:mychat/pages/chat_detail_page.dart';
import 'package:mychat/pages/chat_list_item.dart';

class ChatListPage extends StatelessWidget {
 ChatListPage({super.key});

  final List<Message> mockMessages = [
  Message(
    content: "你好，最近怎么样？",
    timestamp: DateTime.now().subtract(Duration(minutes: 5)),
    type: MessageType.received,
    sender: "张三",
    avatarUrl: "https://picsum.photos/50?random=1",
  ),
  Message(
    content: "我很好，谢谢！你呢？",
    timestamp: DateTime.now().subtract(Duration(minutes: 4)),
    type: MessageType.sent,
    sender: "李四",
    avatarUrl: "https://picsum.photos/50?random=2",
  ),
  Message(
    content: "今天天气不错，我们去外面走走吧！",
    timestamp: DateTime.now().subtract(Duration(minutes: 3)),
    type: MessageType.received,
    sender: "张三",
    avatarUrl: "https://picsum.photos/50?random=1",
  ),
  Message(
    content: "好主意！几点出发？",
    timestamp: DateTime.now().subtract(Duration(minutes: 2)),
    type: MessageType.sent,
    sender: "李四",
    avatarUrl: "https://picsum.photos/50?random=2",
  ),
  Message(
    content: "大约五点吧。",
    timestamp: DateTime.now().subtract(Duration(minutes: 1)),
    type: MessageType.received,
    sender: "张三",
    avatarUrl: "https://picsum.photos/50?random=1",
  ),
  Message(
    content: "好的，等你！",
    timestamp: DateTime.now(),
    type: MessageType.sent,
    sender: "李四",
    avatarUrl: "https://picsum.photos/50?random=2",
  ),
  Message(
    content: "你喜欢吃什么？",
    timestamp: DateTime.now().subtract(Duration(minutes: 6)),
    type: MessageType.received,
    sender: "王五",
    avatarUrl: "https://picsum.photos/50?random=3",
  ),
  Message(
    content: "我喜欢意大利面。",
    timestamp: DateTime.now().subtract(Duration(minutes: 5)),
    type: MessageType.sent,
    sender: "张三",
    avatarUrl: "https://picsum.photos/50?random=1",
  ),
  Message(
    content: "那我们可以去意大利餐厅！",
    timestamp: DateTime.now().subtract(Duration(minutes: 4)),
    type: MessageType.received,
    sender: "王五",
    avatarUrl: "https://picsum.photos/50?random=3",
  ),
  Message(
    content: "听起来不错！",
    timestamp: DateTime.now().subtract(Duration(minutes: 3)),
    type: MessageType.sent,
    sender: "李四",
    avatarUrl: "https://picsum.photos/50?random=2",
  ),
  Message(
    content: "晚上见！",
    timestamp: DateTime.now().subtract(Duration(minutes: 2)),
    type: MessageType.received,
    sender: "张三",
    avatarUrl: "https://picsum.photos/50?random=1",
  ),
  Message(
    content: "再见！",
    timestamp: DateTime.now().subtract(Duration(minutes: 1)),
    type: MessageType.sent,
    sender: "李四",
    avatarUrl: "https://picsum.photos/50?random=2",
  ),
];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mockMessages.length,
      itemBuilder: (context, index) => ChatListItem(
        message: mockMessages[index],
        onTap: () => _navigateToChatDetail(context, mockMessages[index]),
      ),
    );
  }

  void _navigateToChatDetail(BuildContext context, Message message) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => ChatDetailPage(initialMessages: [message]))
    );
  }
  
}
