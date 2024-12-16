import 'package:eateries/data/model/restaurant_detail.dart';

sealed class CustomerReviewResultState {}

class CustomerReviewNoneState extends CustomerReviewResultState {}

class CustomerReviewLoadingState extends CustomerReviewResultState {}

class CustomerReviewErrorState extends CustomerReviewResultState {
  final String error;

  CustomerReviewErrorState(this.error);
}

class CustomerReviewLoadedState extends CustomerReviewResultState {
  final List<CustomerReview> data;

  CustomerReviewLoadedState(this.data);
}
