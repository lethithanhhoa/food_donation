import 'package:flutter/material.dart';
import 'package:she_codes_hackathon/screens/home/for_restaurant/body_home_page.dart';
import 'package:she_codes_hackathon/screens/home/for_restaurant/order_confirmation.dart';
import 'package:she_codes_hackathon/screens/home/map/user_map.dart';

import 'home_page.dart';

class HomePageForRestaurantOwner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageForRestaurantOwnerState();
  }
}

class _HomePageForRestaurantOwnerState
    extends State<HomePageForRestaurantOwner> {
  int indexImage = 0;
  List<Widget> listOfPages = <Widget>[
    BodyOfHomePage(),
    OrderComfirmation(),
    UserMap(),
    Container(),
  ];
  TextEditingController searchBarEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void setIndexImage(int index) {
    setState(() {
      indexImage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: TextFormField(
                    controller: searchBarEditingController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm theo đồ ăn',
                      hintStyle: TextStyle(fontSize: 14),
                      icon: Icon(Icons.search),
                      border: InputBorder.none,
                    )),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),

      body: Center(child: listOfPages.elementAt(indexImage)),
      //footer
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.teal),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Trang chủ')),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu), title: Text('Xác nhận đơn')),
            BottomNavigationBarItem(
                icon: Icon(Icons.map), title: Text('Xem bản đồ')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text('Trang cá nhân')),
          ],
          onTap: setIndexImage,
          currentIndex: indexImage,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
        ),
      ),
    );
  }
}
