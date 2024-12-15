import 'package:eateries/data/api/api_services.dart';
import 'package:eateries/static/restaurant_detail_result_state.dart';
import 'package:flutter/widgets.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestaurantDetailProvider(this._apiServices);

  RestaurantResultState _resultState = RestaurantNoneState();

  RestaurantResultState get resultState => _resultState;

  Future<void> fetchRestaurant(String id) async {
    try {
      _resultState = RestaurantLoadingState();
      notifyListeners();

      final result = await _apiServices.getRestaurant(id);

      if (result.error) {
        _resultState = RestaurantErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = RestaurantLoadedState(result.restaurant);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = RestaurantErrorState(e.toString());
      notifyListeners();
    }
  }
}
