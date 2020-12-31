import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_detail.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/services/restaurant_detail_services.dart';

part 'restaurant_detail_event.dart';
part 'restaurant_detail_state.dart';

class RestaurantDetailBloc
    extends Bloc<RestaurantDetailEvent, RestaurantDetailState> {
  RestaurantDetailBloc() : super(RestaurantDetailInitial());

  @override
  Stream<RestaurantDetailState> mapEventToState(
    RestaurantDetailEvent event,
  ) async* {
    if (event is FetchDetailRestaurant) {
      yield RestaurantDetailLoading();
      var resto = await RestaurantDetailServices.ambilDetailResto(event.id);
      if (resto.error != true) {
        yield RestaurantDetailLoaded(resto.restaurant);
      } else {
        yield RestaurantDetailFailed(message: resto.message);
      }
    }
  }
}
