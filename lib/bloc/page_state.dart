part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class PageInitial extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashLoadingPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashLoadedPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnHomePage extends PageState {
  final int bottomNavBarIndex;

  OnHomePage({this.bottomNavBarIndex = 0});

  @override
  List<Object> get props => [bottomNavBarIndex];
}

class OnDetailRestaurantPage extends PageState {
  final String idrestaurant;

  OnDetailRestaurantPage(this.idrestaurant);
  @override
  List<Object> get props => [idrestaurant];
}

class OnSearchRestaurantPage extends PageState {
  final String parameter;

  OnSearchRestaurantPage({this.parameter});

  @override
  List<Object> get props => [parameter];
}
