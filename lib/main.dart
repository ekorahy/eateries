import 'package:eateries/data/api/api_services.dart';
import 'package:eateries/provider/detail/restaurant_detail_provider.dart';
import 'package:eateries/provider/home/restaurants_list_provider.dart';
import 'package:eateries/provider/search/restaurants_search_provider.dart';
import 'package:eateries/screen/detail/detail_screen.dart';
import 'package:eateries/screen/home/home_screen.dart';
import 'package:eateries/screen/search/search_screen.dart';
import 'package:eateries/static/navigation_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider(create: (context) => ApiServices()),
    ChangeNotifierProvider(
        create: (context) =>
            RestaurantsListProvider(context.read<ApiServices>())),
    ChangeNotifierProvider(
        create: (context) =>
            RestaurantDetailProvider(context.read<ApiServices>())),
    ChangeNotifierProvider(
        create: (context) =>
            RestaurantsSearchProvider(context.read<ApiServices>()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EATERIES',
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const HomeScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
        NavigationRoute.searchRoute.name: (context) => const SearchScreen()
      },
    );
  }
}
