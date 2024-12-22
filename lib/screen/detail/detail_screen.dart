import 'package:eateries/data/model/restaurant.dart';
import 'package:eateries/provider/detail/favorite_icon_provider.dart';
import 'package:eateries/provider/detail/restaurant_detail_provider.dart';
import 'package:eateries/static/restaurant_detail_result_state.dart';
import 'package:eateries/widget/body_of_detail.dart';
import 'package:eateries/widget/favorite_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String restaurantId;

  const DetailScreen({super.key, required this.restaurantId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      if (mounted) {
        await context
            .read<RestaurantDetailProvider>()
            .fetchRestaurant(widget.restaurantId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Restaurant Detail",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        actions: [
          ChangeNotifierProvider(
            create: (context) => FavoriteIconProvider(),
            child: Consumer<RestaurantDetailProvider>(
                builder: (context, value, child) {
              return switch (value.resultState) {
                RestaurantLoadedState(data: var value) => FavoriteIcon(
                    restaurant: Restaurant(
                      id: value.id,
                      name: value.name,
                      description: value.description,
                      pictureId: value.pictureId,
                      city: value.city,
                      rating: value.rating,
                    ),
                  ),
                _ => const SizedBox(),
              };
            }),
          )
        ],
      ),
      body:
          Consumer<RestaurantDetailProvider>(builder: (context, value, child) {
        return switch (value.resultState) {
          RestaurantLoadingState() =>
            const Center(child: CircularProgressIndicator()),
          RestaurantLoadedState(data: var restaurant) => BodyOfDetail(
              restaurant: restaurant,
            ),
          RestaurantErrorState(error: var message) => Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          _ => const SizedBox()
        };
      }),
    );
  }
}
