import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_chat/main.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  //do shit
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _fireStore = FirebaseFirestore.instance;
  String? _fCMToken;
  // FirebaseApi() {
  //   _firebaseMessaging = FirebaseMessaging.instance;
  //   print('Firebase messaging initialized');
  // }
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  setFCMToken() async {
    if (_fCMToken != null) return;
    _fCMToken = await _firebaseMessaging.getToken();
    if (_fCMToken != null) {
      await sharedPreferences.setString('userFCMToken', _fCMToken!);
      await _fireStore.collection('users').add({'deviceToken': _fCMToken});
    }
  }

  sendNotification() async {
    // await _firebaseMessaging.sendMessage(
    //     // to: 'to:', data: {'dataKey': 'dataValue'}
    //     );
    // print('------------------------------------------------------------');
    // print('notification sent');
  }
}
