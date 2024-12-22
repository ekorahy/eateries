import 'package:eateries/data/model/restaurant.dart';
import 'package:eateries/services/sqlite_service.dart';
import 'package:flutter/widgets.dart';

class LocalDatabaseProvider extends ChangeNotifier {
  final SqliteService _service;

  LocalDatabaseProvider(this._service);

  String _message = "";
  String get message => _message;

  List<Restaurant>? _restaurantList;
  List<Restaurant>? get restaurantList => _restaurantList;

  Restaurant? _restaurant;
  Restaurant? get restaurant => _restaurant;

  Future<void> saveRestaurant(Restaurant restaurant) async {
    try {
      final result = await _service.insertItem(restaurant);

      final isError = result == 0;
      if (isError) {
        _message = "Failed to save your data";
        notifyListeners();
      } else {
        _message = "Your data is saved";
        notifyListeners();
      }
    } catch (e) {
      _message = "Failed to save your data";
      notifyListeners();
    }
  }

  Future<void> loadRestaurants() async {
    try {
      _restaurantList = await _service.getRestaurants();
      _message = "All of your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your all data";
      notifyListeners();
    }
  }

  Future<void> loadRestaurantById(String name) async {
    try {
      _restaurant = await _service.getRestaurantById(name);
      _message = "Your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your data";
      notifyListeners();
    }
  }

  Future<void> removeRestaurantById(String name) async {
    try {
      await _service.deleteRestaurant(name);
      _message = "Your data is removed";
      notifyListeners();
    } catch (e) {
      _message = "Failed to remove your data";
      notifyListeners();
    }
  }
}
