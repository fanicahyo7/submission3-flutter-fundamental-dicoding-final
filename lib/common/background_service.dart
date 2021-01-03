import 'dart:isolate';

import 'dart:ui';

import 'package:submission2_flutter_fundamental_dicoding_bloc/common/notification_helper.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/services/restaurant_list_services.dart';

import '../main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService _service;
  static String _isolateName = 'isolate';
  static SendPort _uiSendPort;

  BackgroundService._createObject();

  factory BackgroundService() {
    if (_service == null) {
      _service = BackgroundService._createObject();
    }
    return _service;
  }

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    final NotificationHelpers _notificationHelpers = NotificationHelpers();
    var result = await RestaurantListServices.ambilRestoList();
    await _notificationHelpers.showNotification(flutterLocalNotificationsPlugin, result);
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
