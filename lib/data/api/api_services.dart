import 'dart:convert';
import 'package:eateries/data/model/restaurants_list_response.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<RestaurantsListResponse> getRestaurants() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return RestaurantsListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restaurants list');
    }
  }
}
