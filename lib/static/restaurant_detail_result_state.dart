import 'package:eateries/data/model/restaurant_detail.dart';

sealed class RestaurantResultState {}

class RestaurantNoneState extends RestaurantResultState {}

class RestaurantLoadingState extends RestaurantResultState {}

class RestaurantErrorState extends RestaurantResultState {
  final String error;

  RestaurantErrorState(this.error);
}

class RestaurantLoadedState extends RestaurantResultState {
  final RestaurantDetail data;

  RestaurantLoadedState(this.data);
}
