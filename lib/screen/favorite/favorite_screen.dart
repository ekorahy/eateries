import 'package:eateries/provider/local_database/local_database_provider.dart';
import 'package:eateries/static/navigation_route.dart';
import 'package:eateries/widget/restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<LocalDatabaseProvider>().loadRestaurants();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Restaurants Favorite',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      body: Consumer<LocalDatabaseProvider>(builder: (context, value, child) {
        final restaurantList = value.restaurantList ?? [];
        if (value.restaurantList == null || value.restaurantList!.isEmpty) {
          return const Center(
            child: Text('Empty Favorite data'),
          );
        }

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: restaurantList.length,
          itemBuilder: (context, index) {
            final restaurant = restaurantList[index];
            return RestaurantCard(
                restaurant: restaurant,
                onTap: () {
                  Navigator.pushNamed(context, NavigationRoute.detailRoute.name,
                      arguments: restaurant.id);
                });
          },
        );
      }),
    );
  }
}
