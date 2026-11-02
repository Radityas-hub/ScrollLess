import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  NotificationService._();

  static final instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;

    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );
    await _plugin.initialize(settings: settings);
    _initialized = true;
  }

  Future<bool> requestPermission() async {
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    return await android?.requestNotificationsPermission() ?? false;
  }

  Future<void> showLimitExceeded({
    required int id,
    required String appName,
    required int limitMinutes,
  }) async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'screen_time_limit',
        'Screen time reminders',
        channelDescription: 'Peringatan ketika batas screen time terlewati.',
        importance: Importance.high,
        priority: Priority.high,
      ),
    );

    await _plugin.show(
      id: id,
      title: 'Waktunya berhenti scrolling',
      body: '$appName sudah melewati batas $limitMinutes menit.',
      notificationDetails: details,
      payload: appName,
    );
  }
}
