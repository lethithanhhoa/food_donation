import 'package:flutter/material.dart';

class OrderComfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Đơn chờ xác nhận',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                item(
                    context,
                    'Bánh mỳ Pate kẹp',
                    'https://www.riviu.vn/wp-content/uploads/2020/03/banh_mi__pate_cha_bong.jpg',
                    3),
                item(
                    context,
                    'Cơm suất',
                    'https://comgiaotannoi.net/wp-content/uploads/2018/09/12.-C%C6%A1m-su%E1%BA%A5t-v%C4%83n-ph%C3%B2ng-ngon-b%E1%BB%95-r%E1%BA%BB-giao-t%E1%BA%ADn-n%C6%A1i-uy-t%C3%ADn-ch%E1%BA%A5t-l%C6%B0%E1%BB%A3ng.1.jpg',
                    1),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget item(
      BuildContext context, String foodName, String imagePath, int number) {
    return Container(
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
                        image: Image.network(imagePath).image,
                        fit: BoxFit.cover)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.fastfood,
                              size: 18,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              foodName,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Số lượng: ${number}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: RaisedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                    height: 80,
                                    child: Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.check,
                                          color: Colors.green,
                                          size: 40,
                                        ),
                                        Text('Đã xác nhận'),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        color: Colors.teal[300],
                        child: Text('Xác nhận'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
