part of 'restaurant_search_bloc.dart';

abstract class RestaurantSearchEvent extends Equatable {
  const RestaurantSearchEvent();
}

class SearchRestauranton extends RestaurantSearchEvent {
  final String parameter;

  SearchRestauranton({this.parameter});

  @override
  List<Object> get props => [];
}
