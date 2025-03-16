// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mychat/models/message_model.dart';
import 'package:mychat/widges/message_bubble.dart';

class ChatDetailPage extends StatefulWidget {
  final List<Message> initialMessages;
  const ChatDetailPage({super.key, required this.initialMessages});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _textController = TextEditingController();
  final List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _messages.addAll(widget.initialMessages);
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

    _messages.addAll(mockMessages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('聊天')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: false,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return MessageBubble(message: message);
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: '输入消息...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          IconButton(onPressed: _sendMessage, icon: Icon(Icons.send)),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_textController.text.isEmpty) {
      return;
    }

    final newMessage = Message(
      content: _textController.text,
      timestamp: DateTime.now(),
      type: MessageType.sent,
      sender: '我',
    );

    setState(() {
      _messages.add(newMessage);
      _textController.clear();
    });
  }
}
