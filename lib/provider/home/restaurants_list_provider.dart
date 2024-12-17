import 'dart:io';
import 'package:eateries/data/api/api_services.dart';
import 'package:eateries/static/restaurants_list_result_state.dart';
import 'package:flutter/widgets.dart';

class RestaurantsListProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestaurantsListProvider(this._apiServices);

  RestaurantsListResultState _resultState = RestaurantsListNoneState();

  RestaurantsListResultState get resultState => _resultState;

  Future<void> fetchRestaurantsList() async {
    try {
      _resultState = RestaurantsListLoadingState();
      notifyListeners();

      final result = await _apiServices.getRestaurants();

      if (result.error) {
        _resultState = RestaurantsListErrorState(result.message);
      } else {
        _resultState = RestaurantsListLoadedState(result.restaurants);
      }
    } on SocketException catch (_) {
      _resultState = RestaurantsListErrorState(
          "Request Timeout. Please check your internet connection.");
    } catch (e) {
      _resultState = RestaurantsListErrorState(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
