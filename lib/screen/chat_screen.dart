import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    CollectionReference messages =
        FirebaseFirestore.instance.collection('messages');
    TextEditingController controller = TextEditingController();

    return FutureBuilder<QuerySnapshot>(
      future: messages.get(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error fetching data'),
            ),
          );
        }

        // Process data only if snapshot has data
        if (snapshot.hasData) {
          List<Message> messagesList = snapshot.data!.docs
              .map(
                  (doc) => Message.fromJson(doc.data() as Map<String, dynamic>))
              .toList();

          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Icon(Icons.message),
                  Text('Chat'),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        message: messagesList[index],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a message...',
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          messages.add({
                            'message': controller.text,
                          });
                          controller.clear();
                        },
                        icon: Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          body: Center(
            child: Text('No data available'),
          ),
        );
      },
    );
  }
}

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
        ),
        child: Text(message.messages),
      ),
    );
  }
}

class Message {
  final String messages;

  Message(this.messages);

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(json['message'] ?? '');
  }
}
