import 'dart:convert';
import 'dart:developer';

import 'package:app/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../shared.dart';

class LocalNotificationsService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@drawable/ic_launcher'),
      iOS: DarwinInitializationSettings(
        //   requestSoundPermission: false,
        //   requestBadgePermission: false,
        //   requestAlertPermission: false,
      ),
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (message) {
        if (message.payload != null && message.payload!.isNotEmpty) {
          Map<String, dynamic> data = json.decode(message.payload!);
          // final notificationModel = NotificationModel.fromJson(data);
          // final id = notificationModel.data?.id;
          // final type = notificationModel.data?.type;
          final id = data["id"];
          final type = data["type"];
          NotificationRouteHandler.toggle(rootNavigatorKey.currentContext!, id: id, type: type);
        }
      },
    );
  }

  //for notifications in foreground
  void display(BuildContext context, RemoteMessage message) async {
    try {
      final data = message.notification;
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'appchannel', // id
        'app channel', // title
        description: 'This channel is used for important notifications.',
        importance: Importance.max,

        playSound: true,
      );

      await _flutterLocalNotificationsPlugin.show(
        id,
        data?.title,
        data?.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            importance: Importance.max,
            playSound: true,
            icon: 'ic_launcher',
            color: context.colorScheme.primary,
            // largeIcon: const DrawableResourceAndroidBitmap('android_launcher'),
          ),
          iOS: const DarwinNotificationDetails(),
        ),
        payload: json.encode(message.data),
      );
    } on Exception catch (e) {
      log("Exception:: $e");
    }
  }
}
