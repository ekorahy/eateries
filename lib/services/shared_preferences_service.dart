import '../data/model/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  static const String keyTheme = "THEME";

  Future<void> saveSettingValue(Setting setting) async {
    try {
      await _preferences.setBool(keyTheme, setting.isDarkMode);
    } catch (e) {
      throw Exception("Shared preferences cannot save the setting value.");
    }
  }

  Setting getSettingValue() {
    final isDarkMode = _preferences.getBool(keyTheme) ?? false;
    return Setting(isDarkMode: isDarkMode);
  }
}
