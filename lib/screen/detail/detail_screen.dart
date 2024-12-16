import 'package:eateries/provider/detail/restaurant_detail_provider.dart';
import 'package:eateries/static/restaurant_detail_result_state.dart';
import 'package:eateries/widget/body_of_detail.dart';
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

    Future.microtask(() {
      context
          .read<RestaurantDetailProvider>()
          .fetchRestaurant(widget.restaurantId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Restaurant Detail")),
      body:
          Consumer<RestaurantDetailProvider>(builder: (context, value, child) {
        return switch (value.resultState) {
          RestaurantLoadingState() =>
            const Center(child: CircularProgressIndicator()),
          RestaurantLoadedState(data: var restaurant) => BodyOfDetail(
              restaurant: restaurant,
            ),
          RestaurantErrorState(error: var message) =>
            Center(child: Text(message)),
          _ => const SizedBox()
        };
      }),
    );
  }
}
