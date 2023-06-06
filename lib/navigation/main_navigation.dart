import 'package:flutter/material.dart';
import 'package:themoviedb/library/widgets_lib/provider.dart';

import '../widgets/auth/auth_widget.dart';
import '../widgets/auth/auth_widget_model.dart';
import '../widgets/home/home_page.dart';
import '../widgets/movie_detailis/movie_detailis.dart';

abstract class MainNavigationRouteNames {
  static const auth = 'auth';
  static const homePage = '/';
  static const movieDetails = '/movie_detailis_page';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth ? MainNavigationRouteNames.homePage : MainNavigationRouteNames.auth;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => NotifierProvider(
          model: AuthModel(),
          child: const AuthWidget(),
        ),
    MainNavigationRouteNames.homePage: (context) => const HomePage(),
    //'/bar_page': (context) => const BarPage(),
    MainNavigationRouteNames.movieDetails: (context) {
      final arguments = ModalRoute.of(context)?.settings.arguments;
      if (arguments is int) {
        return MovieDetailis(movieId: arguments);
      } else {
        return const MovieDetailis(movieId: 0);
      }
    }
  };
}
