import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:potje_test_assignment/presentation/views/favorite_view.dart';
import 'package:potje_test_assignment/presentation/resources/strings_manager.dart';
import 'package:potje_test_assignment/presentation/views/search_view.dart';
import 'package:potje_test_assignment/presentation/splash/splash_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String searchRoute = '/search';
  static const String favoriteRoute = '/favorite';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.searchRoute:
        return MaterialPageRoute(
            builder: (_) => ProviderScope(child: SearchView()));
      case Routes.favoriteRoute:
        return MaterialPageRoute(builder: (_) => FavoriteScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text(AppStrings.searchApp),
        ),
      ),
    );
  }
}
