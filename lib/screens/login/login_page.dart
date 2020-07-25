import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:she_codes_hackathon/router/route_name.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible;
  int _currentImage = 0;

  //controller
  PageController pageController = PageController(initialPage: 0);
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController pwdEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _passwordVisible = false;
    });
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentImage < 6) {
        _currentImage++;
      } else {
        _currentImage = 0;
      }

      pageController.animateToPage(
        _currentImage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(children: <Widget>[
            Container(
              color: Colors.teal,
              height: 300,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            )),
          ]),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.teal)),
                    child:
                        PageView(controller: pageController, children: <Widget>[
                      listOfImage(context, 'assets/images/logo.png', ''),
                      listOfImage(context, 'assets/images/wasted_food.jpg',
                          'Mỗi năm, có khoảng 1,3 tỷ tấn thức ăn bị lãng phí trên toàn thế giới.'),
                      listOfImage(context, 'assets/images/wasted_food1.jpg',
                          'Việt Nam là quốc gia xếp thứ 2 châu Á về mức độ lãng phí thực phẩm.'),
                      listOfImage(context, 'assets/images/wasted_food2.jpg',
                          'Thực phẩm thừa trở thành rác thải sinh hoạt hàng ngày.'),
                      listOfImage(context, 'assets/images/wasted_food3.jpg',
                          'Trong khi có rất nhiều người không có đồ ăn.'),
                      listOfImage(context, 'assets/images/wasted_food4.jpg',
                          'Có những tấm lòng với những suất ăn miễn phí tới người nghèo.'),
                      listOfImage(context, 'assets/images/wasted_food5.jpg',
                          'Cùng trao đi yêu thương và chung tay bảo vệ môi trường.'),
                    ]),
                  ),
                  //dot
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 7,
                      effect: WormEffect(
                          spacing: 12.0,
                          dotWidth: 8.0,
                          dotHeight: 8.0,
                          dotColor: Colors.grey[400],
                          activeDotColor: Colors.teal),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      // height: 200,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.teal,
                      child: Column(children: <Widget>[
                        TextFormField(
                            controller: phoneEditingController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                labelText: "Số điện thoại",
                                // hintText: "Số điện thoại",
                                icon: Icon(Icons.phone_iphone))),
                        TextFormField(
                          controller: pwdEditingController,
                          keyboardType: TextInputType.text,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            labelText: "Mật khẩu",
                            icon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.popAndPushNamed(
                                  context, RouteName.homePage);
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Center(
                                child: Text(
                                  'Đăng nhập',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Đăng ký',
                          style: TextStyle(
                              color: Colors.teal,
                              decoration: TextDecoration.underline),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listOfImage(BuildContext context, String imagePath, String content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        )),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width - 40,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: AutoSizeText(
                content,
                maxLines: 2,
                style: TextStyle(fontSize: 18, fontFamily: 'Dancing Script'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
