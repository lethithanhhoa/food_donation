import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:she_codes_hackathon/general/general_parameter.dart';
import 'package:she_codes_hackathon/helper/request_helper.dart';
import 'package:she_codes_hackathon/models/restaurant.dart';
import 'package:she_codes_hackathon/router/route_name.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController mapController;
  String _curItemAtDropList;
  String _address;

  @override
  void initState() {
    super.initState();

    setState(() {
      _curItemAtDropList = 'Tất cả';
      String tmp = '';
      if (placemark == null)
        tmp = 'Vị trí không xác định';
      else {
        tmp = placemark.subThoroughfare;
        if (tmp != '') tmp += ', ';
        tmp += placemark.thoroughfare;
        if (tmp != '') tmp += ', ';
        tmp += placemark.subAdministrativeArea;
        if (tmp != '') tmp += ', ';
        tmp += placemark.administrativeArea;
        if (tmp != '') tmp += ', ';
        tmp += placemark.country;

        _address = tmp;
      }
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget build(BuildContext context) {
    // return GoogleMap(
    //   onMapCreated: _onMapCreated,
    //   initialCameraPosition: CameraPosition(
    //     target: LatLng(position.latitude, position.longitude),
    //     zoom: 20.0,
    //   ),
    // );
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Colors.red,
            ),
            Expanded(
              child: Container(
                child: Text(
                  _address,
                  // (placemark == null)
                  //     ? 'Vị trí không xác định'
                  //     : placemark.subThoroughfare +
                  //         ', ' +
                  //         placemark.thoroughfare +
                  //         ', ' +
                  //         placemark.subAdministrativeArea +
                  //         ', ' +
                  //         placemark.administrativeArea +
                  //         ', ' +
                  //         placemark.country,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
            ),
            Icon(Icons.navigate_next),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Danh sách nhà hàng',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              DropdownButton<String>(
                hint: Text(
                  _curItemAtDropList,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                items: <String>['Tất cả', 'Khả dụng', 'Gần đây']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
                onChanged: (selectedItem) {
                  setState(() {
                    _curItemAtDropList = selectedItem;
                  });
                },
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          child: ListView.builder(
              itemCount: restaurantList.length,
              itemBuilder: (BuildContext context, int index) {
                Restaurant currentRestaurant = restaurantList[index];
                return restaurantListItem(currentRestaurant);
              }),
        ))
      ],
    );
  }

  Widget restaurantListItem(Restaurant curRestaurant) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteName.detailRestaurantPage,
            arguments: curRestaurant);
      },
      child: Container(
          height: 100,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  height: 80,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                          image: Image.network(curRestaurant.imagePath).image,
                          fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.restaurant,
                                size: 18,
                                color: Colors.orange[400],
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                curRestaurant.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            curRestaurant.detailAddress +
                                ', ' +
                                curRestaurant.ward +
                                ', ' +
                                curRestaurant.district +
                                ', ' +
                                curRestaurant.city,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                          child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteName.detailRestaurantPage,
                              arguments: curRestaurant);
                        },
                        color: Colors.teal[300],
                        child: Text('Xem chi tiết'),
                      ))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
