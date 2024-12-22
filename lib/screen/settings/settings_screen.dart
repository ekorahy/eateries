import 'package:eateries/data/model/setting.dart';
import 'package:eateries/provider/settings/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SharedPreferencesProvider>(context);
    final isDarkMode = provider.setting.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Settings",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Dark Theme", style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox.square(dimension: 8,),
            Switch(
              value: isDarkMode,
              onChanged: (value) async {
                final newSetting = Setting(isDarkMode: value);
                await provider.saveSettingValue(newSetting);
              },
              activeColor: Theme.of(context).colorScheme.primary,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
