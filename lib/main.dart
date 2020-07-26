import 'package:flutter/material.dart';
import 'package:she_codes_hackathon/router/route_name.dart';
import 'package:she_codes_hackathon/router/router.dart';
import 'screens/start_app/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Donation',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SplashPage(),
      initialRoute: RouteName.splashPage,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
