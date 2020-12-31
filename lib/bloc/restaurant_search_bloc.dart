import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_search.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/services/restaurant_search_services.dart';

part 'restaurant_search_event.dart';
part 'restaurant_search_state.dart';

class RestaurantSearchBloc
    extends Bloc<RestaurantSearchEvent, RestaurantSearchState> {
  RestaurantSearchBloc() : super(RestaurantSearchInitial());

  @override
  Stream<RestaurantSearchState> mapEventToState(
    RestaurantSearchEvent event,
  ) async* {
    if (event is SearchRestauranton) {
      yield SearchRestaurantLoadingState();
      var resto =
          await RestaurantSearchServices.ambilSearchResto(event.parameter);
      if (resto.error != true) {
        yield RestaurantSearchLoaded(restaurant: resto.restaurants);
      } else {
        yield RestaurantSearchFailed(message: resto.message);
      }
    }
  }
}
