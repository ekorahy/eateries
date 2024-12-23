import 'package:workmanager/workmanager.dart';
import '../data/api/api_services.dart';
import '../utils/notification_helper.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';

void initializeWorkManager() {
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
}

Future<void> scheduleDailyReminder() async {
  final now = DateTime.now();
  final targetTime = DateTime(
    now.year,
    now.month,
    now.day,
    11,
    00,
  );

  final scheduleTime = targetTime.isAfter(now)
      ? targetTime
      : targetTime.add(const Duration(days: 1));

  final initialDelayMinutes = scheduleTime.difference(now).inMinutes;

  Workmanager().registerOneOffTask(
    "dailyReminderTask",
    "dailyReminder",
    initialDelay: Duration(minutes: initialDelayMinutes),
    inputData: {
      "targetHour": targetTime.hour,
      "targetMinute": targetTime.minute,
    },
  );
}

Future<void> cancelDailyReminder() async {
  await Workmanager().cancelByUniqueName('dailyReminderTask');
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final api = ApiServices();

    try {
      final now = DateTime.now();
      final targetHour = inputData?['targetHour'] ?? 11;
      final targetMinute = inputData?['targetMinute'] ?? 00;

      if ((now.hour == targetHour && (now.minute - targetMinute).abs() <= 1)) {
        final response = await api.getRestaurants();
        if (response.restaurants.isNotEmpty) {
          final randomRestaurant = response
              .restaurants[Random().nextInt(response.restaurants.length)];

          await showNotification(
            "Lunch Reminder",
            "How about dining at ${randomRestaurant.name} restaurant today!",
          );

          if (kDebugMode) {
            print("Notification displayed: ${randomRestaurant.name}");
          }
        } else {
          if (kDebugMode) {
            print("No restaurants found.");
          }
        }
      } else {
        if (kDebugMode) {
          print("Now: ${now.hour}:${now.minute}");
          print("Target: $targetHour:$targetMinute");
          print("Current time does not match target time.");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching restaurant: $e");
      }
    }

    return Future.value(true);
  });
}
