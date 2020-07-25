import 'package:geolocator/geolocator.dart';
import 'package:she_codes_hackathon/models/food.dart';
import 'package:she_codes_hackathon/models/restaurant.dart';

Geolocator geolocator;
Position position;
Placemark placemark;
List<Restaurant> restaurantList;
List<Food> foodList = [
  Food(
    id: 1,
    restaurantId: 1,
    name: "Bánh mỳ Pate kẹp",
    description: "Bánh mì ship cho học sinh tiểu học đi tham quan",
    quantity: 12,
    imagePath:
        "https://images.foody.vn/res/g89/881935/prof/s640x400/foody-upload-api-foody-mobile-nha-dau-tay-190116141245.jpg",
    status: '1',
    publishDate: DateTime(2020, 07, 25, 16, 41, 43),
    finishDate: DateTime(2020, 07, 25, 20, 41, 29),
  ),
  Food(
    id: 3,
    restaurantId: 1,
    name: "Cơm suất",
    description: "Cơm suất",
    quantity: 7,
    imagePath:
        "https://images.foody.vn/res/g89/881935/prof/s640x400/foody-upload-api-foody-mobile-nha-dau-tay-190116141245.jpg",
    status: '1',
    publishDate: DateTime(2020, 07, 25, 16, 41, 43),
    finishDate: DateTime(2020, 07, 25, 20, 41, 29),
  ),
];
