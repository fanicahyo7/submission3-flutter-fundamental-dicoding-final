import 'package:flutter/material.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/ui/restaurant_favorite_page.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/ui/restaurant_list.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/ui/setting_page.dart';

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

  Widget createCustomBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.amber,
              unselectedItemColor: Color(0xFFE5E5E5),
              currentIndex: bottomNavBarIndex,
              onTap: (index) {
                setState(() {
                  bottomNavBarIndex = index;
                  pageController.jumpToPage(index);
                });
              },
              items: [
                BottomNavigationBarItem(
                    label: "Home",
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Icon(Icons.home),
                    )),
                BottomNavigationBarItem(
                    label: "Favorite",
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Icon(Icons.favorite),
                    )),
                BottomNavigationBarItem(
                    label: "Setting",
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Icon(Icons.settings),
                    )),
              ]),
        ),
      );

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
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            },
            children: [
              ResturantList(),
              RestaurantFavoritePage(),
              SettingPage(),
            ],
          ),
          createCustomBottomNavBar()
        ],
      ),
    );
  }
}
