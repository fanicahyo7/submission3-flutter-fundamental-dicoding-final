import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/page_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/shared_value.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/ui/hasil_cari.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/ui/home_page.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/ui/restaurant_detail.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/ui/splash_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    prevPageEvent = GoToSplashLoadingPage();
    context.bloc<PageBloc>().add(prevPageEvent);
    // BlocProvider.of<PageBloc>(context).add(GoToSplashLoadedPage());

    return BlocBuilder<PageBloc, PageState>(
      builder: (_, pageState) => (pageState is OnSplashLoadingPage)
          ? SplashPage()
          : (pageState is OnDetailRestaurantPage)
              ? DetailRestaurantPage(pageState.idrestaurant)
              : (pageState is OnSearchRestaurantPage)
                  ? HasilCariPage(
                      parameter: pageState.parameter,
                    )
                  : (pageState is OnHomePage)
                      ? HomePage()
                      : CircularProgressIndicator(),
    );
  }
}
