import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashLoadingPage) {
      yield OnSplashLoadingPage();
      await Future.delayed(Duration(seconds: 2));
      yield OnHomePage(bottomNavBarIndex: 0);
    } else if (event is GoToHomePage) {
      yield OnHomePage(bottomNavBarIndex: event.bottomNavBarIndex);
    } else if (event is GoToDetailRestaurantPage) {
      yield OnDetailRestaurantPage(event.idrestaurant);
    } else if (event is GoToSearchRestaurantPage) {
      yield OnSearchRestaurantPage(parameter: event.parameter);
    }
  }
}
