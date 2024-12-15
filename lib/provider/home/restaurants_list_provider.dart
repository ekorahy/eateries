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
        notifyListeners();
      } else {
        _resultState = RestaurantsListLoadedState(result.restaurants);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = RestaurantsListErrorState(e.toString());
      notifyListeners();
    }
  }
}
