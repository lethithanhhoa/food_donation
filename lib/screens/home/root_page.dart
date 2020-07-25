import 'package:flutter/material.dart';
import 'home_page.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootPageState();
  }
}

class _RootPageState extends State<RootPage> {
  int indexImage = 0;
  List<Widget> listOfPages = <Widget>[
    HomePage(),
    Container(),
    Container(),
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
      //header
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
                      hintText: 'Tìm kiếm nhà hàng',
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
      //body
      body: Center(child: listOfPages.elementAt(indexImage)),
      //footer
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.teal),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_mall), title: Text('Mall')),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), title: Text('History')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text('Me')),
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
