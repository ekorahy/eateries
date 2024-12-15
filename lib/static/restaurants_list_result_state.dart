import 'package:eateries/data/model/restaurant.dart';

sealed class RestaurantsListResultState {}

class RestaurantsListNoneState extends RestaurantsListResultState {}

class RestaurantsListLoadingState extends RestaurantsListResultState {}

class RestaurantsListErrorState extends RestaurantsListResultState {
  final String error;

  RestaurantsListErrorState(this.error);
}

class RestaurantsListLoadedState extends RestaurantsListResultState {
  final List<Restaurant> data;

  RestaurantsListLoadedState(this.data);
}
