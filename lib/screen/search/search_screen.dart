import 'package:eateries/provider/search/restaurants_search_provider.dart';
import 'package:eateries/static/navigation_route.dart';
import 'package:flutter/material.dart';
import 'package:eateries/static/restaurants_search_result_state.dart';
import 'package:eateries/widget/restaurant_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Restaurants"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for restaurants...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    context
                        .read<RestaurantsSearchProvider>()
                        .fetchRestaurantsSearch("");
                  },
                ),
              ),
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  context
                      .read<RestaurantsSearchProvider>()
                      .fetchRestaurantsSearch(query);
                }
              },
            ),
          ),
          Expanded(
            child: Consumer<RestaurantsSearchProvider>(
              builder: (context, provider, child) {
                return switch (provider.resultState) {
                  RestaurantsSearchLoadingState() =>
                    const Center(child: CircularProgressIndicator()),
                  RestaurantsSearchLoadedState(data: var restaurantList) =>
                    restaurantList.isNotEmpty
                        ? ListView.builder(
                            itemCount: restaurantList.length,
                            itemBuilder: (context, index) {
                              final restaurant = restaurantList[index];
                              return RestaurantCard(
                                restaurant: restaurant,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    NavigationRoute.detailRoute.name,
                                    arguments: restaurant.id,
                                  );
                                },
                              );
                            },
                          )
                        : const Center(
                            child: Text("No restaurants found."),
                          ),
                  RestaurantsSearchErrorState(error: var message) =>
                    Center(child: Text(message)),
                  _ => const SizedBox(),
                };
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
