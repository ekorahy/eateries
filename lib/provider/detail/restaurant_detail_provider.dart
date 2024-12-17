import 'dart:io';

import 'package:eateries/data/api/api_services.dart';
import 'package:eateries/static/customer_review_result_state.dart';
import 'package:eateries/static/restaurant_detail_result_state.dart';
import 'package:flutter/widgets.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestaurantDetailProvider(this._apiServices);

  RestaurantResultState _resultState = RestaurantNoneState();
  CustomerReviewResultState _customerReviewState = CustomerReviewNoneState();

  RestaurantResultState get resultState => _resultState;
  CustomerReviewResultState get customerReviewState => _customerReviewState;

  Future<void> fetchRestaurant(String id) async {
    try {
      _resultState = RestaurantLoadingState();
      notifyListeners();

      final result = await _apiServices.getRestaurant(id);

      if (result.error) {
        _resultState = RestaurantErrorState(result.message);
      } else {
        _resultState = RestaurantLoadedState(result.restaurant);
        _customerReviewState =
            CustomerReviewLoadedState(result.restaurant.customerReviews);
      }
    } on SocketException catch (_) {
      _resultState = RestaurantErrorState(
          "Request Timeout. Please check your internet connection.");
    } catch (e) {
      _resultState = RestaurantErrorState(e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> postReview(String id, String name, String review) async {
    try {
      _customerReviewState = CustomerReviewLoadingState();

      final result = await _apiServices.postReview(id, name, review);

      if (result.error) {
        _customerReviewState = CustomerReviewErrorState(result.message);
      } else {
        _customerReviewState = CustomerReviewLoadedState(result.customerReview);
      }
    } on SocketException catch (_) {
      _customerReviewState = CustomerReviewErrorState(
          "Request Timeout. Please check your internet connection.");
    } catch (e) {
      _customerReviewState = CustomerReviewErrorState(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
