import 'package:eateries/data/model/restaurant_detail.dart';

class AddReviewResponse {
  final bool error;
  final String message;
  final List<CustomerReview> customerReview;

  AddReviewResponse({
    required this.error,
    required this.message,
    required this.customerReview,
  });

  factory AddReviewResponse.fromJson(Map<String, dynamic> json) =>
      AddReviewResponse(
          error: json["error"],
          message: json["message"],
          customerReview: List<CustomerReview>.from(json["customerReviews"].map(
              (customerReview) => CustomerReview.fromJson(customerReview))));
}
