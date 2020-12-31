part of 'restaurant_list_bloc.dart';

abstract class RestaurantListEvent extends Equatable {
  const RestaurantListEvent();
}

class FetchRestaurantList extends RestaurantListEvent {
  @override
  List<Object> get props => [];
}
