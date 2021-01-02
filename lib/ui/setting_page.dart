import 'package:flutter/material.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/style.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                    trailing: Switch.adaptive(value: true, onChanged: null),
                    // trailing: BlocBuilder<SchedulingBloc, SchedulingState>(
                    //   builder: (context, state) {
                    //     if (state is SchedulingSetAlarmState) {
                    //       return Switch.adaptive(
                    //           value: true,
                    //           onChanged: (_) {
                    //             if (Platform.isIOS) {
                    //               alertDialog(context);
                    //             } else {
                    //               BlocProvider.of<SchedulingBloc>(context)
                    //                   .add(CancelScheduling());
                    //             }
                    //           });
                    //     } else {
                    //       return Switch.adaptive(
                    //           value: false,
                    //           onChanged: (_) {
                    //             if (Platform.isIOS) {
                    //               alertDialog(context);
                    //             } else {
                    //               BlocProvider.of<SchedulingBloc>(context)
                    //                   .add(SetScheduling());
                    //             }
                    //           });
                    //     }
                    //   },
                    // ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
  }
}
