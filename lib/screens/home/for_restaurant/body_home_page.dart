import 'package:flutter/material.dart';
import 'package:she_codes_hackathon/general/general_parameter.dart';

class BodyOfHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120,
            // color: Colors.yellow,
            child: Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              Image.network(restaurantList[0].imagePath).image,
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                restaurantList[0].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                child: Text(
                                  restaurantList[0].detailAddress +
                                      ', ' +
                                      restaurantList[0].ward +
                                      ', ' +
                                      restaurantList[0].district +
                                      ', ' +
                                      restaurantList[0].city,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Số loại đồ ăn có sẵn: 15',
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            'Danh sách đồ ăn',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                item('Cơm gà',
                    'https://agiadinh.net/wp-content/uploads/2018/05/cach-lam-com-ga-xoi-mo-4-600x362.jpg'),
                item('Cơm rang',
                    'https://ameovat.com/wp-content/uploads/2018/03/cach-lam-com-chien-trung-4-600x400.jpg'),
                item('Bún bò Huế',
                    'https://ameovat.com/wp-content/uploads/2016/04/bun-bo-hue-ngon-02.jpg'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget item(String foodName, String imagePath) {
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
                          'Số lượng: 5',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.teal[300],
                        child: Text('Chỉnh sửa'),
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
