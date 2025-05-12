import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:shared/src/models/notification_data/notification_data_model.dart';
import 'package:shared/src/models/notification_header/notification_header_model.dart';

import '../../shared.dart';

class SendNotificationService {
  static sendToUsers(
    BuildContext context, {
    required String id,
    required String type,
    required String titleEn,
    required String titleAr,
    required String bodyEn,
    required String bodyAr,
  }) async {
    // final filter = Filter(Filter(MyFields.idBranch, isEqualTo: kBranch?.id));
    final usersQuerySnapshot =
        await kFirebaseInstant.users.where(MyFields.idBranch, isEqualTo: kBranch?.id).get();

    for (var doc in usersQuerySnapshot.docs) {
      final docRef = doc.reference;
      final user = doc.data();
      final token = user.deviceToken;
      final languageCode = user.languageCode;

      final title = languageCode == LanguageEnum.english ? titleEn : titleAr;
      final body = languageCode == LanguageEnum.english ? bodyEn : bodyAr;

      final notificationModel = NotificationModel(
        notification: NotificationHeaderModel(title: title, body: body),
        token: token,
        data: NotificationDataModel(id: id, type: type),
      );

      docRef.update({MyFields.unReadNotificationsCount: FieldValue.increment(1)});

      _send(context, notificationModel: notificationModel);
    }
  }

  static Future<void> _send(
    BuildContext context, {
    required NotificationModel notificationModel,
  }) async {
    final accessToken = await _getAccessToken();

    final notification = notificationModel.notification!;
    final data = notificationModel.data!;
    final token = notificationModel.token!;
    var json = <String, dynamic>{
      "notification": notification.toJson(),
      "data": data.toJson(),
      "token": token,
    };

    final result = await http.post(
      Uri.parse('https://fcm.googleapis.com/v1/projects/hajjwarehouses/messages:send'),
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $accessToken'},
      body: jsonEncode({
        "message": {
          ...json,
          "apns": {
            "payload": {
              "aps": {"sound": "default"},
            },
          },
        },
      }),
    );
    if (result.statusCode == 200) {
      final documentREF = FirebaseFirestore.instance.collection("notifications").doc();
      json["id"] = documentREF.id;
      json["createdAt"] = FieldValue.serverTimestamp();
      await documentREF.set(json);
      debugPrint("Notification Sent Successfully!!");
    } else {
      debugPrint("NotificationStatus Failed:: ${result.body} ${result.statusCode}");
    }
  }

  static Future<String> _getAccessToken() async {
    // Load the service account JSON from the assets folder
    final String serviceAccountString = await rootBundle.loadString(
      'assets/serviceAccountKey.json',
    );

    print("serviceAccountString:: $serviceAccountString");

    // Parse the JSON string into a Map
    final serviceAccountJson = jsonDecode(serviceAccountString);

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    // Obtain the access token
    auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    // Close the HTTP client
    client.close();

    // Return the access token
    return credentials.accessToken.data;
  }
}
