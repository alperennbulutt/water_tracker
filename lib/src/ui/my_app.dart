import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/services/notification_service.dart';
import 'package:water_tracker/src/ui/dashboard/dashboard_page.dart';
import 'package:water_tracker/src/ui/notification/notification_page.dart';
import 'login/login_page.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator"); //
  @override
  void initState() {
    super.initState();
    // NotificationService().init(context, navigatorKey);

    // FirebaseMessaging.instance
    //     .getInitialMessage()
    //     .then((RemoteMessage? message) {
    //   if (message != null) {
    //     var payloadData = message.data["route"].toString().split('/');

    //     var payloadType = payloadData[0];
    //     var payloadValue = payloadData[1];

    //     showDialog(context: context, builder: (context) => NotificationPage());
    //   }
    // });

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print('notification geldi' + message.notification!.title.toString());
    //   RemoteNotification? notification = message.notification;
    //   Map<String, dynamic> payloadData = message.data;

    //   if (notification != null && !kIsWeb) {
    //     print('notification geldii' + notification.title.toString());
    //     NotificationService().showLocalNotification(notification, payloadData);
    //   }
    // });
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        Get.to(NotificationPage());
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Get.to(NotificationPage());
    });
  }

  // Future<void> sendPushMessage() async {
  //   if (_token == null) {
  //     print('Unable to send FCM message, no token exists.');
  //     return;
  //   }

  //   try {
  //     await http.post(
  //       Uri.parse('https://api.rnfirebase.io/messaging/send'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: constructFCMPayload(_token),
  //     );
  //     print('FCM request for device sent!');
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> onActionSelected(String value) async {
  //   switch (value) {
  //     case 'subscribe':
  //       {
  //         print(
  //           'FlutterFire Messaging Example: Subscribing to topic "fcm_test".',
  //         );
  //         await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
  //         print(
  //           'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.',
  //         );
  //       }
  //       break;
  //     case 'unsubscribe':
  //       {
  //         print(
  //           'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".',
  //         );
  //         await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
  //         print(
  //           'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.',
  //         );
  //       }
  //       break;
  //     case 'get_apns_token':
  //       {
  //         if (defaultTargetPlatform == TargetPlatform.iOS ||
  //             defaultTargetPlatform == TargetPlatform.macOS) {
  //           print('FlutterFire Messaging Example: Getting APNs token...');
  //           String? token = await FirebaseMessaging.instance.getAPNSToken();
  //           print('FlutterFire Messaging Example: Got APNs token: $token');
  //         } else {
  //           print(
  //             'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.',
  //           );
  //         }
  //       }
  //       break;
  //     default:
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DashboardPage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
