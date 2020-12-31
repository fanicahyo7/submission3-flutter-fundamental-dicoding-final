import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/page_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_detail_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/shared_value.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/style.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/widgets/no_internet.dart';

class DetailRestaurantPage extends StatefulWidget {
  final String idrestaurant;

  DetailRestaurantPage(this.idrestaurant);
  @override
  _DetailRestaurantPageState createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToHomePage());
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.amber,
            ),
            SafeArea(
                child: Container(
              color: Colors.white,
            )),
            SafeArea(
              child: SingleChildScrollView(
                child: BlocProvider(
                  create: (_) => RestaurantDetailBloc()
                    ..add(FetchDetailRestaurant(widget.idrestaurant)),
                  child:
                      BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
                          builder: (_, detailList) {
                    if (detailList is RestaurantDetailLoaded) {
                      return Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: (detailList.restaurant.pictureId !=
                                            null)
                                        ? NetworkImage(baseURL +
                                            'images/medium/' +
                                            detailList.restaurant.pictureId)
                                        : AssetImage('assets/no-image.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 56,
                                margin: EdgeInsets.only(
                                    top: 20, bottom: 90, left: 16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                    onTap: () {
                                      context
                                          .read<PageBloc>()
                                          .add(GoToHomePage());
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 135),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text(
                                            detailList.restaurant.name,
                                            style: font1.copyWith(fontSize: 24),
                                          ),
                                        ),
                                        Icon(
                                          Icons.favorite_outline,
                                          color: Colors.amber,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.pin_drop),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 3, vertical: 6),
                                          child: Text(
                                              detailList.restaurant.address +
                                                  ", "),
                                        ),
                                        Text(detailList.restaurant.city)
                                      ],
                                    ),
                                    Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 6),
                                        child: Text(
                                          'Categori',
                                          style: font1.copyWith(fontSize: 15),
                                        )),
                                    Row(
                                      children: detailList.restaurant.categories
                                          .map((e) => Container(
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                child: Text(
                                                  e.name,
                                                  style: font2,
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                    Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 6),
                                        child: Text(
                                          'Description',
                                          style: font1.copyWith(fontSize: 15),
                                        )),
                                    Text(
                                      detailList.restaurant.description,
                                      textAlign: TextAlign.justify,
                                    ),
                                    Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 6),
                                        child: Text(
                                          'Menu',
                                          style: font1.copyWith(fontSize: 15),
                                        )),
                                    Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 6),
                                        child: Text(
                                          'Foods',
                                          style: font1.copyWith(fontSize: 15),
                                        )),
                                    Container(
                                      height: 70,
                                      width: double.infinity,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: detailList
                                            .restaurant.menus.foods
                                            .map((e) => Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                      Colors.amber,
                                                      Colors.white
                                                    ])),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      e.name,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: font1,
                                                      maxLines: 1,
                                                    ),
                                                  ],
                                                )))
                                            .toList(),
                                      ),
                                    ),
                                    Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 6),
                                        child: Text(
                                          'Drinks',
                                          style: font1.copyWith(fontSize: 15),
                                        )),
                                    Container(
                                      height: 70,
                                      width: double.infinity,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: detailList
                                            .restaurant.menus.drinks
                                            .map((e) => Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                      Colors.amber,
                                                      Colors.white
                                                    ])),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      e.name,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: font1,
                                                      maxLines: 1,
                                                    ),
                                                  ],
                                                )))
                                            .toList(),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: 16, bottom: 10),
                                        child: Text(
                                          'Review Customers',
                                          style: font1.copyWith(fontSize: 15),
                                        )),
                                    Column(
                                      children: detailList
                                          .restaurant.customerReviews
                                          .map((e) => Container(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          e.name,
                                                          style: font1.copyWith(
                                                              fontSize: 14),
                                                        ),
                                                        Text(
                                                          e.date,
                                                          style: font2.copyWith(
                                                              fontSize: 14),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10),
                                                      child: Text(
                                                        '"' + e.review + '"',
                                                        style: font1.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    } else if (detailList is RestaurantDetailFailed) {
                      return NoInternetPage(
                        pesan: detailList.message,
                      );
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            Text('Memuat Data')
                          ],
                        ),
                      );
                    }
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
