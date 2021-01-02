import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'restaurant_favorite_event.dart';
part 'restaurant_favorite_state.dart';

class RestaurantFavoriteBloc extends Bloc<RestaurantFavoriteEvent, RestaurantFavoriteState> {
  RestaurantFavoriteBloc() : super(RestaurantFavoriteInitial());

  @override
  Stream<RestaurantFavoriteState> mapEventToState(
    RestaurantFavoriteEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
