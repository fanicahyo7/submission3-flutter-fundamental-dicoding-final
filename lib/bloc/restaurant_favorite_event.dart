part of 'restaurant_favorite_bloc.dart';

abstract class RestaurantFavoriteEvent extends Equatable {
  const RestaurantFavoriteEvent();
}

class GetListFavoriteRestaurant extends RestaurantFavoriteEvent {
  @override
  List<Object> get props => [];
}


class InsertFavoriteRestaurant extends RestaurantFavoriteEvent {
  final Resto restaurantTableData;

  InsertFavoriteRestaurant({@required this.restaurantTableData});

  @override
  List<Object> get props => [restaurantTableData];
}

class DeleteFavoriteRestaurant extends RestaurantFavoriteEvent {
  final Resto restaurantTableData;

  DeleteFavoriteRestaurant({@required this.restaurantTableData});

  @override
  List<Object> get props => [restaurantTableData];
}
