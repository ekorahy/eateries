import 'package:eateries/data/model/restaurant.dart';

sealed class RestaurantsSearchResultState {}

class RestaurantsSearchNoneState extends RestaurantsSearchResultState {}

class RestaurantsSearchLoadingState extends RestaurantsSearchResultState {}

class RestaurantsSearchErrorState extends RestaurantsSearchResultState {
  final String error;

  RestaurantsSearchErrorState(this.error);
}

class RestaurantsSearchLoadedState extends RestaurantsSearchResultState {
  final List<Restaurant> data;

  RestaurantsSearchLoadedState(this.data);
}
