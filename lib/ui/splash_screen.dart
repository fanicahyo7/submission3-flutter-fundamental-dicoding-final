import 'package:flutter/material.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/style.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/resto.png",
              width: 200,
              height: 100,
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                "Fani Restaurant",
                style: font1.copyWith(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
