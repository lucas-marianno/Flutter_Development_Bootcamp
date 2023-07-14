import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/api/firebase_api.dart';
import 'package:flutter_chat/constants.dart';
import 'package:flutter_chat/main.dart';
import 'package:flutter_chat/screens/welcome_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const String name = '/chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  String messageText = '';
  late User user;
  TextEditingController textEditingController = TextEditingController();
  List<Widget> messagesList = [];

  sendMessage() {
    if (messageText.isNotEmpty) {
      firestore.collection('messages').add({
        'text': messageText,
        'senderId': user.email,
        'dateTime': DateTime.now(),
      });
      textEditingController.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    user = auth.currentUser!;

    // getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                FirebaseApi().sendNotification();
              },
              icon: const Icon(Icons.send)),
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () async {
                await auth.signOut();
                await sharedPreferences.clear();
                // ignore: use_build_context_synchronously
                Navigator.popAndPushNamed(context, WelcomeScreen.name);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MessagesStreamBuilder(firestore: firestore, user: user),
          Container(
            decoration: kMessageContainerDecoration,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: kMessageTextFieldDecoration,
                    onChanged: (value) => messageText = value,
                    onEditingComplete: () => sendMessage(),
                  ),
                ),
                OutlinedButton(
                  onPressed: () => sendMessage(),
                  child: const Text(
                    'Send',
                    style: kSendButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessagesStreamBuilder extends StatelessWidget {
  const MessagesStreamBuilder({
    super.key,
    required this.firestore,
    required this.user,
  });

  final FirebaseFirestore firestore;
  final User user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final messages = snapshot.data!.docs;
          messages.sort((a, b) {
            return ((b.data() as Map<String, dynamic>)['dateTime'] as Timestamp)
                .compareTo(((a.data() as Map<String, dynamic>)['dateTime'] as Timestamp));
          });

          List<Widget> messageBubblesList = [];

          for (var message in messages) {
            final data = message.data() as Map<String, dynamic>;
            final sender = data['senderId'];

            messageBubblesList.add(MessageBalloon(
              sender: sender,
              message: data['text'],
              timestamp: data['dateTime'],
              isUserSender: sender == user.email,
            ));
          }

          return Expanded(
            child: ListView(
              reverse: true,
              children: messageBubblesList,
            ),
          );
        }
      },
    );
  }
}

class MessageBalloon extends StatelessWidget {
  const MessageBalloon({
    super.key,
    required this.sender,
    required this.message,
    required this.timestamp,
    required this.isUserSender,
  });
  final String sender;
  final String message;
  final Timestamp timestamp;
  final bool isUserSender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: isUserSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender, style: const TextStyle(fontSize: 15)),
          Material(
            elevation: 5,
            color: isUserSender ? Colors.lightBlueAccent : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isUserSender ? 30 : 0),
              topRight: Radius.circular(isUserSender ? 0 : 30),
              bottomLeft: const Radius.circular(30),
              bottomRight: const Radius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Column(
                crossAxisAlignment:
                    isUserSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  RichText(
                    textAlign: isUserSender ? TextAlign.end : TextAlign.start,
                    text: TextSpan(
                      text: message,
                      style: TextStyle(
                        fontSize: 25,
                        color: isUserSender ? Colors.white : const Color.fromRGBO(33, 33, 33, 1),
                      ),
                    ),
                  ),
                  Text(
                    timestampToString(timestamp),
                    style: TextStyle(
                      fontSize: 12,
                      color: isUserSender ? Colors.white : const Color.fromRGBO(33, 33, 33, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String timestampToString(Timestamp t) {
  String hour = '${t.toDate().hour}';
  String minute = '${t.toDate().minute}';

  hour = hour.length == 1 ? '0$hour' : hour;
  minute = minute.length == 1 ? '0$minute' : minute;

  return '$hour:$minute';
}
