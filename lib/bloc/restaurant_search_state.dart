part of 'restaurant_search_bloc.dart';

abstract class RestaurantSearchState extends Equatable {
  const RestaurantSearchState();
}

class RestaurantSearchInitial extends RestaurantSearchState {
  @override
  List<Object> get props => [];
}

class SearchRestaurantLoadingState extends RestaurantSearchState {
  @override
  List<Object> get props => [];
}

class RestaurantSearchLoaded extends RestaurantSearchState {
  final List<Restaurantss> restaurant;

  RestaurantSearchLoaded({this.restaurant});

  @override
  List<Object> get props => [restaurant];
}

class RestaurantSearchFailed extends RestaurantSearchState {
  final String message;

  RestaurantSearchFailed({this.message});

  @override
  List<Object> get props => [message];
}
