import 'package:eateries/data/model/restaurant.dart';
import 'package:eateries/provider/detail/favorite_icon_provider.dart';
import 'package:eateries/provider/local_database/local_database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteIcon extends StatefulWidget {
  final Restaurant restaurant;

  const FavoriteIcon({super.key, required this.restaurant});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  void initState() {
    final localDatabaseProvider = context.read<LocalDatabaseProvider>();
    final favoriteIconProvider = context.read<FavoriteIconProvider>();

    Future.microtask(() async {
      await localDatabaseProvider.loadRestaurantById(widget.restaurant.name);
      final value =
          localDatabaseProvider.restaurant!.name == widget.restaurant.name;

      favoriteIconProvider.isFavorite = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          final localDatabaseProvider = context.read<LocalDatabaseProvider>();
          final favoriteIconProvider = context.read<FavoriteIconProvider>();
          final isFavorite = favoriteIconProvider.isFavorite;

          if (!isFavorite) {
            await localDatabaseProvider.saveRestaurant(widget.restaurant);
          } else {
            await localDatabaseProvider
                .removeRestaurantById(widget.restaurant.name);
          }

          favoriteIconProvider.isFavorite = !isFavorite;
          localDatabaseProvider.loadRestaurants();
        },
        icon: Icon(
          context.watch<FavoriteIconProvider>().isFavorite
              ? Icons.favorite
              : Icons.favorite_border,
          color: Theme.of(context).colorScheme.primary,
        ));
  }
}
