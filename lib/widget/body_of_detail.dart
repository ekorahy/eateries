import 'package:eateries/provider/detail/restaurant_detail_provider.dart';
import 'package:eateries/static/customer_review_result_state.dart';
import 'package:flutter/material.dart';
import 'package:eateries/data/model/restaurant_detail.dart';
import 'package:provider/provider.dart';

class BodyOfDetail extends StatefulWidget {
  final Restaurant restaurant;

  const BodyOfDetail({super.key, required this.restaurant});

  @override
  State<BodyOfDetail> createState() => _BodyOfDetailState();
}

class _BodyOfDetailState extends State<BodyOfDetail> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();

  void _addReview() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final review = _reviewController.text.trim();

      context.read<RestaurantDetailProvider>().postReview(
            widget.restaurant.id,
            name,
            review,
          );

      _nameController.clear();
      _reviewController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://restaurant-api.dicoding.dev/images/small/${widget.restaurant.pictureId}",
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(widget.restaurant.name),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Text("${widget.restaurant.city}, ${widget.restaurant.address}"),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text(widget.restaurant.rating.toString()),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(widget.restaurant.description),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Customer Reviews"),
                const SizedBox(height: 8),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: "Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _reviewController,
                        decoration: const InputDecoration(labelText: "Review"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Review cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _addReview,
                        child: const Text("Submit Review"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Consumer<RestaurantDetailProvider>(
                  builder: (context, value, child) {
                    return switch (value.customerReviewState) {
                      CustomerReviewLoadingState() => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      CustomerReviewLoadedState(data: var customerReviews) =>
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: customerReviews.length,
                          itemBuilder: (context, index) {
                            final review = customerReviews[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        review.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(review.date),
                                      const SizedBox(height: 8),
                                      Text(review.review),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      CustomerReviewErrorState(error: var message) => Center(
                          child: Text(
                            message,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      _ => const SizedBox(),
                    };
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
