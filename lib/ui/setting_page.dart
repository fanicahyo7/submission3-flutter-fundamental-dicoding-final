import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/setting_reminder_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/style.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/services/setting_preferences.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingReminderBloc(
          restaurantSettingPreferences: RestaurantSettingPreferencesac())
        ..add(CheckReminder()),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 16),
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                    child: Text(
                      'Settings',
                      style: font1.copyWith(fontSize: 30),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.5),
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text("Pasang Notifikasi"),
                    trailing:
                        BlocBuilder<SettingReminderBloc, SettingReminderState>(
                      builder: (context, state) {
                        if (state is SettingReminderOnState) {
                          return Switch.adaptive(
                              value: true,
                              onChanged: (_) {
                                BlocProvider.of<SettingReminderBloc>(context)
                                    .add(OffReminder());
                              });
                        } else {
                          return Switch.adaptive(
                              value: false,
                              onChanged: (_) {
                                BlocProvider.of<SettingReminderBloc>(context)
                                    .add(OnReminder());
                              });
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
