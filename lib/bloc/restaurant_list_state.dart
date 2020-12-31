part of 'restaurant_list_bloc.dart';

abstract class RestaurantListState extends Equatable {
  const RestaurantListState();
}

class RestaurantListInitial extends RestaurantListState {
  @override
  List<Object> get props => [];
}

class RestaurantListLoading extends RestaurantListState {
  @override
  List<Object> get props => [];
}

class RestaurantListLoaded extends RestaurantListState {
  final List<Restaurants> restolist;

  RestaurantListLoaded({this.restolist});

  @override
  List<Object> get props => [restolist];
}

class RestaurantListError extends RestaurantListState {
  final String message;

  RestaurantListError({this.message});

  @override
  List<Object> get props => [message];
}
