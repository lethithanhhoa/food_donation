import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:provider/provider.dart';
import 'package:she_codes_hackathon/general/general_parameter.dart';
import 'package:she_codes_hackathon/helper/request_helper.dart';
import 'package:she_codes_hackathon/models/food.dart';
import 'package:she_codes_hackathon/models/restaurant.dart';

class DetailRestaurantPage extends StatefulWidget {
  Restaurant restaurant;
  DetailRestaurantPage({this.restaurant});
  _DetailRestaurantPageState createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  List<int> items;
  int totalItems;
  List<int> quantity;

  @override
  void initState() {
    super.initState();
    items = List.filled(20, 0);
    totalItems = 0;
    quantity = [
      foodList[0].quantity,
      foodList[1].quantity,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.restaurant.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Địa chỉ nhà hàng',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                                  widget.restaurant.detailAddress +
                                      ', ' +
                                      widget.restaurant.ward +
                                      ', ' +
                                      widget.restaurant.district +
                                      ', ' +
                                      widget.restaurant.city,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                ),
                              ),
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Danh sách đồ ăn',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          Food curFood = foodList[index];

                          return itemInFoodList(curFood, index);
                        }),
                  ))
                ]),
          ),
          Container(
              height: 80,
              child: Center(
                  child: RaisedButton(
                onPressed: () {
                  print('..................');
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.all(10),
                          titlePadding: EdgeInsets.all(10),
                          title: Text(
                            'Đăng ký nhận đồ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          actions: <Widget>[
                            RaisedButton(
                              child: Text('Hủy bỏ'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            RaisedButton(
                              child: Text('Xác nhận'),
                              color: Colors.green,
                              onPressed: () {
                                setState(() {
                                  quantity[0] -= items[0];
                                  quantity[1] -= items[1];
                                });
                                foodList[0].quantity -= items[0];
                                foodList[1].quantity -= items[1];
                                setState(() {
                                  items[0] = 0;
                                  items[1] = 0;
                                  totalItems = 0;
                                });
                                Navigator.pop(context);
                              },
                            )
                          ],
                          content: ListView(
                            padding: EdgeInsets.all(0),
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Tình nguyện viên: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Nguyễn An',
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Nhà hàng: ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                  Text(widget.restaurant.name,
                                      style: TextStyle(fontSize: 14))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Thời gian nhận đồ: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  DropdownButton<String>(
                                    items: <String>[
                                      '1 tiếng',
                                      '2 tiếng',
                                      '3 tiếng'
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (selectedItem) {},
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Danh sách đồ ăn:',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              (items[0] > 0)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Bánh mỳ Pate kẹp: ',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          '${items[0]}',
                                          style: TextStyle(fontSize: 14),
                                        )
                                      ],
                                    )
                                  : Container(),
                              SizedBox(
                                height: 15,
                              ),
                              (items[1] > 0)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Cơm suất: ',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          '${items[1]}',
                                          style: TextStyle(fontSize: 14),
                                        )
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                        );
                      });
                },
                child: Text('Nhận đồ (' + totalItems.toString() + ')'),
              )))
        ],
      ),
    );
  }

  Widget itemInFoodList(Food food, int index) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                      image: Image.network(food.imagePath).image,
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        food.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        food.description,
                        style: TextStyle(fontSize: 10, color: Colors.black54),
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Text(
                    'Số lượng: ' + quantity[index].toString(),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if (items[index] > 0) {
                        setState(() {
                          items[index]--;
                          totalItems--;
                        });
                      }
                    },
                    child: Icon(
                      Icons.remove_circle_outline,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    items[index].toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (items[index] < food.quantity) {
                        setState(() {
                          items[index]++;
                          totalItems++;
                        });
                      }
                    },
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
