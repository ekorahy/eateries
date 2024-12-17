import 'package:eateries/provider/home/restaurants_list_provider.dart';
import 'package:eateries/static/navigation_route.dart';
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

    Future.microtask(() async {
      if (mounted) {
        await context.read<RestaurantsListProvider>().fetchRestaurantsList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "EATERIES",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, NavigationRoute.searchRoute.name);
              },
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                shape: const CircleBorder(),
              ),
            ),
          ],
        ),
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

                  return RestaurantCard(
                      restaurant: restaurant,
                      onTap: () {
                        Navigator.pushNamed(
                            context, NavigationRoute.detailRoute.name,
                            arguments: restaurant.id);
                      });
                },
              ),
            RestaurantsListErrorState(error: var message) => Center(
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
            _ => const SizedBox(),
          };
        }));
  }
}
