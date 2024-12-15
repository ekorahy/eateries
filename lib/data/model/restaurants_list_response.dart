import 'package:eateries/data/model/restaurant.dart';

class RestaurantsListResponse {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  RestaurantsListResponse(
      {required this.error,
      required this.message,
      required this.count,
      required this.restaurants});

  factory RestaurantsListResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantsListResponse(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: json["restaurants"] != null
            ? List<Restaurant>.from(json["restaurants"]!
                .map((restaurant) => Restaurant.fromJson(restaurant)))
            : <Restaurant>[]);
  }
}
