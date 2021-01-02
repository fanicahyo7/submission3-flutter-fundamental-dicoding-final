part of 'restaurant_favorite_bloc.dart';

abstract class RestaurantFavoriteState extends Equatable {
  const RestaurantFavoriteState();
}

class RestaurantFavoriteInitial extends RestaurantFavoriteState {
  @override
  List<Object> get props => [];
}
