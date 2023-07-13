import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/constants.dart';

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

  List<Widget> messagesList = [];

  // getMessages() async {
  //   await for (var snapshot in firestore.collection('messages2').snapshots()) {
  //     messagesList.clear();

  //     var snapshotDataList = snapshot.docs;

  //     snapshotDataList.sort((a, b) => a.data()['dateTime'].compareTo(b.data()['dateTime']));

  //     for (var message in snapshotDataList) {
  //       final String sender = message.data()['senderId'].toString();
  //       messagesList.add(MessageBalloon(
  //         sender: sender,
  //         message: message.data()['text'].toString(),
  //         timestamp: message.data()['dateTime'],
  //         isUserSender: sender == user.email,
  //       ));
  //       setState(() {});
  //     }
  //   }
  // }

  sendMessage() {
    if (messageText.isNotEmpty) {
      firestore.collection('messages2').add({
        'text': messageText,
        'senderId': user.email,
        'dateTime': DateTime.now(),
      });
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
              icon: const Icon(Icons.close),
              onPressed: () async {
                await auth.signOut();
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                reverse: true,
                child: MessagesStreamBuilder(firestore: firestore, user: user),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   crossAxisAlignment: CrossAxisAlignment.stretch,
                //   children: messagesList,
                // ),
              ),
            ),
          ),
          Container(
            decoration: kMessageContainerDecoration,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: TextEditingController(),
                    decoration: kMessageTextFieldDecoration,
                    onChanged: (value) => messageText = value,
                    onSubmitted: (_) => sendMessage(),
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
      stream: firestore.collection('messages2').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final messages = snapshot.data!.docs;
        messages.sort((a, b) {
          return ((a.data() as Map<String, dynamic>)['dateTime'] as Timestamp)
              .compareTo(((b.data() as Map<String, dynamic>)['dateTime'] as Timestamp));
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

        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: messageBubblesList,
        );
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
    String datetime = '${timestamp.toDate().hour}:'
        '${timestamp.toDate().minute}:'
        '${timestamp.toDate().second}';

    const BoxDecoration decorationReceived = BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.zero,
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(30),
      ),
      color: Color.fromRGBO(224, 224, 224, 1),
    );
    const BoxDecoration decorationSent = BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.zero,
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(10),
      ),
      color: Color.fromRGBO(189, 189, 189, 1),
    );

    if (isUserSender) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 50,
          right: 20,
        ),
        child: Container(
          decoration: decorationSent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(datetime),
                    Text(sender, style: const TextStyle(fontSize: 20)),
                  ],
                ),
                RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    text: message,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(33, 33, 33, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
          right: 50,
        ),
        child: Container(
          decoration: decorationReceived,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(sender, style: const TextStyle(fontSize: 20)), Text(datetime)],
                ),
                RichText(
                  text: TextSpan(
                    text: message,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(33, 33, 33, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
