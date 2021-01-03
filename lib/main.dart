import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_detail_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_list_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_search_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/navigation.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/ui/wrapper.dart';

import 'bloc/page_bloc.dart';
// import 'bloc/setting_reminder_bloc.dart';
import 'common/background_service.dart';
import 'common/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelpers _notificationHelper = NotificationHelpers();
  final BackgroundService _service = BackgroundService();
  _service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc()),
        BlocProvider(
          create: (_) => RestaurantListBloc()..add(FetchRestaurantList()),
        ),
        BlocProvider(create: (_) => RestaurantDetailBloc()),
        BlocProvider(create: (_) => RestaurantSearchBloc()),
        // BlocProvider(create: (_) => SettingReminderBloc()),
      ],
      child: MaterialApp(
        navigatorKey: navigationKey,
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
