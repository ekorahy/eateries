import 'package:eateries/data/model/restaurant.dart';

class RestaurantsSearchResultResponse {
  final bool error;
  final int founded;
  final List<Restaurant> restaurants;

  RestaurantsSearchResultResponse({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory RestaurantsSearchResultResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantsSearchResultResponse(
        error: json["error"],
        founded: json["founded"],
        restaurants: json["restaurants"] != null
            ? List<Restaurant>.from(json["restaurants"]!
                .map((restaurant) => Restaurant.fromJson(restaurant)))
            : <Restaurant>[]);
  }
}
