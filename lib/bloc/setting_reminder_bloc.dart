import 'dart:async';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/background_service.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/date_helper.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/services/setting_preferences.dart';

part 'setting_reminder_event.dart';
part 'setting_reminder_state.dart';

class SettingReminderBloc
    extends Bloc<SettingReminderEvent, SettingReminderState> {
  RestaurantSettingPreferences restaurantSettingPreferences;
  SettingReminderBloc({@required this.restaurantSettingPreferences})
      : super(SettingReminderInitial());

  @override
  Stream<SettingReminderState> mapEventToState(
    SettingReminderEvent event,
  ) async* {
    if (event is CheckReminder) {
      yield SettingReminderLoadingState();
      bool value = await restaurantSettingPreferences.ambilSetting();
      if (value == true) {
        yield SettingReminderOnState();
      } else {
        yield SettingReminderOffState();
      }
    } else if (event is OnReminder) {
      yield SettingReminderLoadingState();
      await AndroidAlarmManager.periodic(
        Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateHelper.format(),
        exact: true,
        wakeup: true,
      );
      await restaurantSettingPreferences.saveSetting(true);
      yield SettingReminderOnState();
    } else if (event is OffReminder) {
      yield SettingReminderLoadingState();
      await AndroidAlarmManager.cancel(1);
      await restaurantSettingPreferences.saveSetting(false);
      yield SettingReminderOffState();
    }
  }
}
