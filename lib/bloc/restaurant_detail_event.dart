part of 'restaurant_detail_bloc.dart';

abstract class RestaurantDetailEvent extends Equatable {
  const RestaurantDetailEvent();
}

class FetchDetailRestaurant extends RestaurantDetailEvent {
  final String id;

  FetchDetailRestaurant(this.id);
  @override
  List<Object> get props => [id];
}
