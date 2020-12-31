import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_detail_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_list_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_search_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/ui/wrapper.dart';

import 'bloc/page_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc()),
        BlocProvider(
          create: (_) => RestaurantListBloc()..add(FetchRestaurantList()),
        ),
        BlocProvider(create: (_) => RestaurantDetailBloc()),
        BlocProvider(create: (_) => RestaurantSearchBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
