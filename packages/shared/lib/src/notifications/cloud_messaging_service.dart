import 'dart:developer';
import 'dart:io' show Platform;

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../shared.dart';
import 'local_notifications_service.dart';

class CloudMessagingService {
  void requestPermission(BuildContext context) async {
    await FirebaseMessaging.instance
        .requestPermission()
        .then((value) async {
          if (Platform.isIOS) {
            await FirebaseMessaging.instance.getAPNSToken();
          }
          FirebaseMessaging.instance.subscribeToTopic('all_${MySharedPreferences.language}');
        })
        .then((onValue) {
          if (context.mounted) {
            init(context);
          }
        });
  }

  Future<void> init(BuildContext context) async {
    await LocalNotificationsService().initialize();

    FirebaseMessaging.onMessage.listen((event) {
      if (context.mounted) {
        _handleLocalMessage(context, event);
      }
    });

    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
  }

  void _handleLocalMessage(BuildContext context, RemoteMessage? message) {
    final data = message?.notification;
    log(
      "ReceivedNotification::\nType:: ForegroundMessage\nTitle:: ${data?.title}\nBody:: ${data?.body}\nData:: ${message?.data}",
    );
    LocalNotificationsService().display(context, message!);
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    final data = message.notification;
    debugPrint(
      "ReceivedNotification::\nType:: Background\nTitle:: ${data?.title}\nBody:: ${data?.body}\nData:: ${message.data}",
    );
    // final notificationModel = NotificationModel.fromJson(message.data);
    // final id = notificationModel.data?.id;
    // final type = notificationModel.data?.type;
    // final dataJson = message.data;
    // final id = dataJson["id"];
    // final type = dataJson["type"];
    // DeepRouteHandler.toggle(rootNavigatorKey.currentContext!, id: id, type: type);
  }
}
