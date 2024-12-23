import 'package:eateries/data/api/api_services.dart';
import 'package:eateries/provider/detail/restaurant_detail_provider.dart';
import 'package:eateries/provider/home/restaurants_list_provider.dart';
import 'package:eateries/provider/local_database/local_database_provider.dart';
import 'package:eateries/provider/main/index_nav_provider.dart';
import 'package:eateries/provider/search/restaurants_search_provider.dart';
import 'package:eateries/provider/settings/shared_preferences_provider.dart';
import 'package:eateries/screen/detail/detail_screen.dart';
import 'package:eateries/screen/main/main_screen.dart';
import 'package:eateries/screen/search/search_screen.dart';
import 'package:eateries/services/shared_preferences_service.dart';
import 'package:eateries/services/sqlite_service.dart';
import 'package:eateries/static/navigation_route.dart';
import 'package:eateries/style/theme/theme.dart';
import 'package:eateries/utils/notification_helper.dart';
import 'package:eateries/utils/workmanager_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  initializeNotifications();

  initializeWorkManager();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => ApiServices()),
        Provider(create: (context) => SqliteService()),
        Provider(create: (context) => SharedPreferencesService(prefs)),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantsListProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantDetailProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantsSearchProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(create: (context) => IndexNavProvider()),
        ChangeNotifierProvider(
          create: (context) =>
              LocalDatabaseProvider(context.read<SqliteService>()),
        ),
        ChangeNotifierProvider(
          create: (context) {
            final provider = SharedPreferencesProvider(
              context.read<SharedPreferencesService>(),
            )..getSettingValue();

            provider.getSettingValue().then((_) {
              if (provider.setting.isDailyReminderOn) {
                scheduleDailyReminder();
              } else {
                cancelDailyReminder();
              }
            });

            return provider;
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SharedPreferencesProvider>(context);
    final isDarkMode = provider.setting.isDarkMode;

    MaterialTheme theme = MaterialTheme();

    return MaterialApp(
      title: 'EATERIES',
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const MainScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
        NavigationRoute.searchRoute.name: (context) => const SearchScreen(),
      },
    );
  }
}
