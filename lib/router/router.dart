import 'package:flutter/material.dart';
import 'package:she_codes_hackathon/models/restaurant.dart';
import 'package:she_codes_hackathon/screens/home/detail_restaurant.dart/detail_restaurant_page.dart';
import 'package:she_codes_hackathon/screens/home/for_restaurant/home_page.dart';
import 'package:she_codes_hackathon/screens/home/for_volunteer/root_page.dart';
import 'package:she_codes_hackathon/screens/login/login_page.dart';
import 'package:she_codes_hackathon/screens/start_app/splash_page.dart';

class Router {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashPage());
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (context) => RootPage());
      case '/detail_restaurant':
        {
          Restaurant restaurant = settings.arguments as Restaurant;
          return MaterialPageRoute(
              builder: (context) => DetailRestaurantPage(
                    restaurant: restaurant,
                  ));
        }
      case '/home_for_restaurant':
        return MaterialPageRoute(
            builder: (context) => HomePageForRestaurantOwner());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
