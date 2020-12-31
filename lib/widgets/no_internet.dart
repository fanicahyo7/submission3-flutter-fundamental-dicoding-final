import 'package:flutter/material.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/style.dart';

class NoInternetPage extends StatelessWidget {
  final String pesan;

  NoInternetPage({this.pesan});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: EdgeInsets.all(16),
          child: Text(
            pesan,
            textAlign: TextAlign.center,
            style: font1,
          )),
    );
  }
}
