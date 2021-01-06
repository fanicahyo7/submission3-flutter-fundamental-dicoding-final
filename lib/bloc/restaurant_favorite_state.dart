part of 'restaurant_favorite_bloc.dart';

abstract class RestaurantFavoriteState extends Equatable {
  const RestaurantFavoriteState();
}

class RestaurantFavoriteInitial extends RestaurantFavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteRestaurantLoadingState extends RestaurantFavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteRestaurantFailedState extends RestaurantFavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteRestaurantSuccessGetListState extends RestaurantFavoriteState {
  final List<Resto> listRestaurantTableData;

  FavoriteRestaurantSuccessGetListState(
      {@required this.listRestaurantTableData});

  @override
  List<Object> get props => [listRestaurantTableData];
}

class FavoriteRestaurantSuccessGetListByIdState
    extends RestaurantFavoriteState {
  final Resto restaurantTableData;

  FavoriteRestaurantSuccessGetListByIdState(
      {@required this.restaurantTableData});

  @override
  List<Object> get props => [restaurantTableData];
}

class FavoriteRestaurantSuccessInsertState extends RestaurantFavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteRestaurantSuccessDeleteState extends RestaurantFavoriteState {
  @override
  List<Object> get props => [];
}