import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/page_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_list_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/style.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_list.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/widgets/card_resto.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/widgets/no_internet.dart';

class ResturantList extends StatefulWidget {
  @override
  _ResturantListState createState() => _ResturantListState();
}

class _ResturantListState extends State<ResturantList> {
  TextEditingController cari = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 16, top: 16),
                  child: Text(
                    'Restaurant',
                    style: font1.copyWith(fontSize: 30),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 16, bottom: 6),
                    child: Text(
                      'Recommendation restaurant for you!',
                      style: font2.copyWith(fontSize: 14),
                    )),
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 16 - 16 - 100,
                    margin: EdgeInsets.only(left: 16, bottom: 6),
                    child: TextField(
                      controller: cari,
                    ),
                  ),
                  Container(
                      width: 90,
                      margin: EdgeInsets.only(right: 16, left: 10),
                      child: RaisedButton(
                        onPressed: () {
                          context.read<PageBloc>().add(
                              GoToSearchRestaurantPage(parameter: cari.text));
                        },
                        child: Text('Cari'),
                      ))
                ],
              ),
              BlocBuilder<RestaurantListBloc, RestaurantListState>(
                  builder: (_, restoListState) {
                if (restoListState is RestaurantListLoaded) {
                  List<Restaurants> restoList = restoListState.restolist;
                  if (restoList.isEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text('Data Restaurant Tidak Ada')],
                    );
                  } else {
                    return Column(
                      children: restoList
                          .map((e) => CardResto(
                                e,
                                restoList,
                                onTap: () {
                                  context
                                      .read<PageBloc>()
                                      .add(GoToDetailRestaurantPage(e.id));
                                },
                              ))
                          .toList(),
                    );
                  }
                } else if (restoListState is RestaurantListError) {
                  return NoInternetPage(
                    pesan: restoListState.message,
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Memuat Data')
                    ],
                  );
                }
              }),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ],
      ),
    );
  }
}
