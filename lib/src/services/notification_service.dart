import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/ui/notification/notification_page.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
late AndroidNotificationChannel channel = AndroidNotificationChannel(
    "water_tracker_notification_channel", "Water Tracker");

class NotificationService {
  Future<void> init(
    BuildContext context,
    GlobalKey<NavigatorState> navigatorKey,
  ) async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      print('payload burada yazacak' + payload.toString());
      showDialog(
        context: navigatorKey.currentState!.context,
        builder: (context) => NotificationPage(),
      );
    });

    // channel = const AndroidNotificationChannel(
    //   'water_tracker_notification_channel', // id
    //   'Water Tracker', // title // description
    //   importance: Importance.defaultImportance,
    // );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // for ios
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  redirectPage(String routes) async {
    Get.toNamed(routes);
  }

  showLocalNotification(RemoteNotification? notification,
      Map<String, dynamic> payloadData) async {
    await flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification!.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          icon: 'app_icon',
          playSound: true,
          enableVibration: true,
        ),
        iOS: IOSNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: payloadData["route"],
    );
  }
}
