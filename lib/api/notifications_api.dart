import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);

  static Future _notificationDetails() async => NotificationDetails(
        android: AndroidNotificationDetails('id', 'name',
            channelDescription: 'description', importance: Importance.max),
      );
}
