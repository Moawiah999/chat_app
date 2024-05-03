class Message {
  final String messages;

  Message(this.messages);
  factory Message.fromJson(jsondata) {
    return Message(jsondata['messages']);
  }
}
