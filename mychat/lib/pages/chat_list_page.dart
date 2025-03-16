import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://picsum.photos/50?random=$index'),
        ),
        title: Text('好友 $index'),
        subtitle: Text('最后一条消息...'),
        trailing: Text('15:30'),
      ),);
  }
  
}
