// ignore_for_file: public_member_api_docs, sort_constructors_first
enum MessageType { sent, received }

class Message {
  final String content;
  final DateTime timestamp;
  final MessageType type;
  final String sender;
  final String? avatarUrl;

  Message({
    required this.content,
    required this.timestamp,
    required this.type,
    required this.sender,
    this.avatarUrl,
  });
}
