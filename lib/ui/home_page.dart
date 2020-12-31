import 'package:flutter/material.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/ui/restaurant_list.dart';

class HomePage extends StatefulWidget {
  final int bottomNavBarIndex;

  const HomePage({this.bottomNavBarIndex = 0});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
          ),
          SafeArea(
              child: Container(
            color: Colors.grey[100],
          )),
          ResturantList(),
        ],
      ),
    );
  }
}
