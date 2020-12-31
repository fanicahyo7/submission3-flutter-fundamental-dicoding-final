part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashLoadingPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSplashLoadedPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToHomePage extends PageEvent {
  final int bottomNavBarIndex;

  GoToHomePage({this.bottomNavBarIndex = 0});

  @override
  List<Object> get props => [bottomNavBarIndex];
}

class GoToDetailRestaurantPage extends PageEvent {
  final String idrestaurant;

  GoToDetailRestaurantPage(this.idrestaurant);

  @override
  List<Object> get props => [idrestaurant];
}

class GoToSearchRestaurantPage extends PageEvent {
  final String parameter;

  GoToSearchRestaurantPage({this.parameter});

  @override
  List<Object> get props => [parameter];
}
