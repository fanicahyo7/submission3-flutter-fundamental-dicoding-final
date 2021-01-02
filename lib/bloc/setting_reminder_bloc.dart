import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'setting_reminder_event.dart';
part 'setting_reminder_state.dart';

class SettingReminderBloc extends Bloc<SettingReminderEvent, SettingReminderState> {
  SettingReminderBloc() : super(SettingReminderInitial());

  @override
  Stream<SettingReminderState> mapEventToState(
    SettingReminderEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
