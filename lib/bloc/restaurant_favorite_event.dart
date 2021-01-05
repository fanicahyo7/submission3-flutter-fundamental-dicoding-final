part of 'restaurant_favorite_bloc.dart';

abstract class RestaurantFavoriteEvent extends Equatable {
  const RestaurantFavoriteEvent();
}

class GetListFavoriteRestaurant extends RestaurantFavoriteEvent {
  @override
  List<Object> get props => [];
}

class GetListFavoriteRestaurantById extends RestaurantFavoriteEvent {
  final String id;

  GetListFavoriteRestaurantById({@required this.id});

  @override
  List<Object> get props => [id];
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
