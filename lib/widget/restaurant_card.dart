import 'package:eateries/data/model/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final Function() onTap;

  const RestaurantCard(
      {super.key, required this.restaurant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 80,
                    minHeight: 80,
                    maxWidth: 120,
                    minWidth: 120,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}",
                        fit: BoxFit.cover,
                      ))),
              const SizedBox.square(
                dimension: 16.0,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(restaurant.name),
                  const SizedBox.square(
                    dimension: 6.0,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on_rounded),
                          const SizedBox.square(
                            dimension: 4,
                          ),
                          Text(restaurant.city),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Row(
                        children: [
                          const Icon(Icons.star),
                          const SizedBox.square(
                            dimension: 4,
                          ),
                          Text(restaurant.rating.toString()),
                        ],
                      ),
                    ],
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
