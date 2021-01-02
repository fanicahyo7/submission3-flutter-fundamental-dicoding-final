part of 'setting_reminder_bloc.dart';

abstract class SettingReminderEvent extends Equatable {
  const SettingReminderEvent();
}

class CheckReminder extends SettingReminderEvent{
  @override
  List<Object> get props => [];
}

class OnReminder extends SettingReminderEvent{
  @override
  List<Object> get props => [];
}

class OffReminder extends SettingReminderEvent{
  @override
  List<Object> get props => [];
}
