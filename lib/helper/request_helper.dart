import 'package:she_codes_hackathon/general/general_parameter.dart';
import 'package:she_codes_hackathon/models/food.dart';
import 'package:she_codes_hackathon/models/restaurant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestHelper {
  Future<List<Restaurant>> getRestaurantList() async {
    final response =
        await http.get('http://192.168.13.46:5005/list_restaurant');

    if (response.statusCode == 200) {
      List<dynamic> result = json.decode(response.body);
      return result.map((data) => Restaurant.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Food>> getFoodList() async {
    String path = 'http://192.168.13.46:5005/detail_restaurant/1'; 
        // restaurantId.toString();
    final response = await http.get(path);
    print(path);

    if (response.statusCode == 200) {

      List<dynamic> result = json.decode(response.body);
      print(response.body);
      print(result);
      return result.map((data) => Food.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
