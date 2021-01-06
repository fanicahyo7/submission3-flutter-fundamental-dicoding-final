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
    print(event.toString());

    if (event is GetListFavoriteRestaurant) {
      yield FavoriteRestaurantLoadingState();
      List<Resto> listFavoriteRestaurant = [];
      DatabaseHelper _dbHelper;

      listFavoriteRestaurant = await _dbHelper.getBookmarks();
      if (listFavoriteRestaurant.isEmpty) {
        yield FavoriteRestaurantFailedState();
      } else {
        yield FavoriteRestaurantSuccessGetListState(
            listRestaurantTableData: listFavoriteRestaurant);
      }
    } else if (event is GetListFavoriteRestaurantById) {
      yield FavoriteRestaurantLoadingState();
      Resto favoriteRestaurant;
      DatabaseHelper _dbHelper;
      print(event.id);
      favoriteRestaurant = await _dbHelper.getBookmarkById(event.id);

      print(favoriteRestaurant != null);
      if (favoriteRestaurant != null) {
        yield FavoriteRestaurantSuccessGetListByIdState(
            restaurantTableData: favoriteRestaurant);
      } else {
        yield FavoriteRestaurantFailedState();
      }
      // } else if (event is InsertFavoriteRestaurant) {
      //   try {
      //     yield FavoriteRestaurantLoadingState();
      //     DatabaseHelper _dbHelper;
      //     await _dbHelper.insertBookmark(event.restaurantTableData);
      //     yield FavoriteRestaurantSuccessInsertState();
      //   } catch (e) {
      //     yield FavoriteRestaurantFailedState();
      //   }
      // } else if (event is DeleteFavoriteRestaurant) {
      //   try {
      //     yield FavoriteRestaurantLoadingState();
      //     DatabaseHelper _dbHelper;
      //     await _dbHelper.insertRestoFav(event.restaurantTableData);
      //     yield FavoriteRestaurantSuccessDeleteState();
      //   } catch (e) {
      //     yield FavoriteRestaurantFailedState();
      //   }
    }
  }
}
