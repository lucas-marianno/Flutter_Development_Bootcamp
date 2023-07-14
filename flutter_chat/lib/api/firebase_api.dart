import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  //do shit
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  // FirebaseApi() {
  //   _firebaseMessaging = FirebaseMessaging.instance;
  //   print('Firebase messaging initialized');
  // }
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final String? fCMToken = await _firebaseMessaging.getToken();

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  sendNotification() async {
    // await _firebaseMessaging.sendMessage(
    //     // to: 'to:', data: {'dataKey': 'dataValue'}
    //     );
    // print('------------------------------------------------------------');
    // print('notification sent');
  }
}
