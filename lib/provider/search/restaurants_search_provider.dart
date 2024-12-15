import 'package:eateries/data/api/api_services.dart';
import 'package:eateries/static/restaurants_search_result_state.dart';
import 'package:flutter/widgets.dart';

class RestaurantsSearchProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestaurantsSearchProvider(this._apiServices);

  RestaurantsSearchResultState _resultState = RestaurantsSearchNoneState();

  RestaurantsSearchResultState get resultState => _resultState;

  Future<void> fetchRestaurantsSearch(String query) async {
    try {
      _resultState = RestaurantsSearchLoadingState();
      notifyListeners();

      final result = await _apiServices.getSearchRestaurants(query);

      if (result.error) {
        _resultState =
            RestaurantsSearchErrorState('Failed to search restaurants');
        notifyListeners();
      } else {
        _resultState = RestaurantsSearchLoadedState(result.restaurants);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = RestaurantsSearchErrorState(e.toString());
      notifyListeners();
    }
  }
}
