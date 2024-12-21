import 'package:eateries/provider/main/index_nav_provider.dart';
import 'package:eateries/screen/favorite/favorite_screen.dart';
import 'package:eateries/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IndexNavProvider>(builder: (context, value, child) {
        return switch (value.indexBottomNavbar) {
          1 => const FavoriteScreen(),
          _ => const HomeScreen()
        };
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<IndexNavProvider>().indexBottomNavbar,
        onTap: (index) {
          context.read<IndexNavProvider>().setIndexBottomNavbar = index;
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home', tooltip: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
              tooltip: 'Favorite')
        ],
      ),
    );
  }
}
