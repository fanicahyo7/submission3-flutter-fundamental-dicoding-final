import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/database_helper.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/resto_db.dart';

part 'restaurant_favorite_event.dart';
part 'restaurant_favorite_state.dart';

class RestaurantFavoriteBloc
    extends Bloc<RestaurantFavoriteEvent, RestaurantFavoriteState> {
  RestaurantFavoriteBloc() : super(RestaurantFavoriteInitial());

  @override
  Stream<RestaurantFavoriteState> mapEventToState(
    RestaurantFavoriteEvent event,
  ) async* {
    if (event is GetListFavoriteRestaurant) {
      yield FavoriteRestaurantLoadingState();
      List<Resto> listFavoriteRestaurant = [];
      DatabaseHelper _dbHelper;

      listFavoriteRestaurant = await _dbHelper.getRestoFav();
      if (listFavoriteRestaurant.isEmpty) {
        yield FavoriteRestaurantFailedState();
      } else {
        yield FavoriteRestaurantSuccessGetListState(
            listRestaurantTableData: listFavoriteRestaurant);
      }
    }
  }
}
