import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // Android initialization settings
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("icon"); // Use a valid drawable resource

    InitializationSettings initializationSettings =
        const InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS: DarwinInitializationSettings() // Uncomment if you plan to support iOS
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse:
          (NotificationResponse notificationResponse) async {
        // Handle background notification response
      },
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      await _notificationDetails(),
      payload: payload, // Include payload if needed
    );
  }

  Future<NotificationDetails> _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "channelId",
        "channelName",
        channelDescription: "Your channel description",
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        icon: "icon", // Ensure this matches your icon name
      ),
    );
  }
}
