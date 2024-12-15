import 'package:eateries/provider/home/restaurants_list_provider.dart';
import 'package:eateries/static/restaurants_list_result_state.dart';
import 'package:eateries/widget/restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<RestaurantsListProvider>().fetchRestaurantsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("EATERIES")),
        body:
            Consumer<RestaurantsListProvider>(builder: (context, value, child) {
          return switch (value.resultState) {
            RestaurantsListLoadingState() =>
              const Center(child: CircularProgressIndicator()),
            RestaurantsListLoadedState(data: var restaurantList) =>
              ListView.builder(
                itemCount: restaurantList.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurantList[index];

                  return RestaurantCard(restaurant: restaurant, onTap: () {});
                },
              ),
            RestaurantsListErrorState(error: var message) => Center(
                child: Text(message),
              ),
            _ => const SizedBox(),
          };
        }));
  }
}
