import 'package:eateries/data/model/restaurant_detail.dart';

class RestaurantResponse {
  final bool error;
  final String message;
  final RestaurantDetail restaurant;

  RestaurantResponse(
      {required this.error, required this.message, required this.restaurant});

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantResponse(
        error: json["error"],
        message: json["message"],
        restaurant: RestaurantDetail.fromJson(json['restaurant']));
  }
}
