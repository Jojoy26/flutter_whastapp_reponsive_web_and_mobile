class ContactModel {
  final String avatar;
  final String name;
  final String lastMessageDate;
  final List<Message> messagesList;
  ContactModel({
    required this.avatar,
    required this.name,
    required this.lastMessageDate,
    required this.messagesList,
  });
}

class Message {
  final String message;
  final String hour;
  final bool isMine;
  Message({
    required this.message,
    required this.hour,
    required this.isMine,
  });
}
