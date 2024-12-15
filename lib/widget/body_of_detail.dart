import 'package:eateries/data/model/restaurant_detail.dart';
import 'package:flutter/material.dart';

class BodyOfDetail extends StatelessWidget {
  final Restaurant restaurant;

  const BodyOfDetail({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}",
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(restaurant.name),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("${restaurant.city}, ${restaurant.address}"),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text(restaurant.rating.toString()),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(restaurant.description),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Categories"),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: restaurant.categories
                      .map((category) => Chip(label: Text(category.name)))
                      .toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Menus"),
                const SizedBox(height: 8),
                const Text("Foods"),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: restaurant.menus.foods
                      .map((food) => Chip(label: Text(food.name)))
                      .toList(),
                ),
                const SizedBox(height: 16),
                const Text("Drinks"),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: restaurant.menus.drinks
                      .map((drink) => Chip(label: Text(drink.name)))
                      .toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Customer Reviews"),
                const SizedBox(height: 8),
                ...restaurant.customerReviews.map(
                  (review) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(review.name),
                            const SizedBox(height: 4),
                            Text(review.date),
                            const SizedBox(height: 8),
                            Text(review.review),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
