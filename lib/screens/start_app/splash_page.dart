import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:she_codes_hackathon/general/general_parameter.dart';
import 'package:she_codes_hackathon/helper/request_helper.dart';
import 'package:she_codes_hackathon/models/restaurant.dart';
import 'package:she_codes_hackathon/router/route_name.dart';

class SplashPage extends StatefulWidget {
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      geolocator = Geolocator()..forceAndroidLocationManager = true;
    });

    Geolocator().getPositionStream().listen((Position p) {
      print(p.longitude);
      setState(() {
        position = p;
      });
      Geolocator()
          .placemarkFromCoordinates(p.latitude, p.longitude)
          .then((value) {
        (value == null) ? placemark = null : placemark = value.single;
      });
    });

    RequestHelper().getRestaurantList().then((value) {
      print (value);
      restaurantList = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 13), () {
      Navigator.popAndPushNamed(context, RouteName.loginPage);
    });
    // if (restaurantList != null) Navigator.popAndPushNamed(context, RouteName.loginPage);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.jpg'),
            AutoSizeText(
              'Fogo',
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            SizedBox(
              height: 10.0,
            ),
            //Need change another font
            AutoSizeText(
              'Food for all, Good for all',
              style: TextStyle(
                color: Colors.teal,
                fontFamily: 'Dancing Script',
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
