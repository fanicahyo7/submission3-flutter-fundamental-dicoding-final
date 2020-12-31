import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/page_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_search_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/style.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_search.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/widgets/card_searh.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/widgets/no_internet.dart';

class HasilCariPage extends StatefulWidget {
  final String parameter;

  HasilCariPage({this.parameter = ""});
  @override
  _HasilCariPageState createState() => _HasilCariPageState();
}

class _HasilCariPageState extends State<HasilCariPage> {
  TextEditingController cari = TextEditingController();

  @override
  void initState() {
    super.initState();
    cari.text = widget.parameter;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToHomePage());
        return;
      },
      child: BlocProvider(
        create: (_) => RestaurantSearchBloc()
          ..add(SearchRestauranton(parameter: widget.parameter)),
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
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 16, top: 16, bottom: 16),
                            child: Text(
                              'Hasil Cari',
                              style: font1.copyWith(fontSize: 20),
                            ),
                          ),
                        ),
                        BlocBuilder<RestaurantSearchBloc,
                                RestaurantSearchState>(
                            builder: (_, restoListState) {
                          print(widget.parameter);
                          print(restoListState.toString());
                          if (restoListState is RestaurantSearchLoaded) {
                            List<Restaurantss> restoList =
                                restoListState.restaurant;
                            if (restoList.isEmpty) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [Text('Data Restaurant Tidak Ada')],
                              );
                            } else {
                              return Column(
                                children: restoList
                                    .map((e) => CardRestoSearch(
                                          e,
                                          restoList,
                                          onTap: () {
                                            context.read<PageBloc>().add(
                                                GoToDetailRestaurantPage(e.id));
                                          },
                                        ))
                                    .toList(),
                              );
                            }
                          } else if (restoListState is RestaurantSearchFailed) {
                            return NoInternetPage(
                              pesan: restoListState.message,
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
                        SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
