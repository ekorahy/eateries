import '../data/model/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  static const String keyTheme = "THEME";
  static const String keyDailyReminder = "DAILY_REMINDER";

  Future<void> saveSettingValue(Setting setting) async {
    try {
      await _preferences.setBool(keyTheme, setting.isDarkMode);
      await _preferences.setBool(keyDailyReminder, setting.isDailyReminderOn);
    } catch (e) {
      throw Exception("Shared preferences cannot save the setting value.");
    }
  }

  Setting getSettingValue() {
    final isDarkMode = _preferences.getBool(keyTheme) ?? false;
    final isDailyReminderOn = _preferences.getBool(keyDailyReminder) ?? false;
    return Setting(
      isDarkMode: isDarkMode,
      isDailyReminderOn: isDailyReminderOn,
    );
  }
}
