import 'package:eateries/data/model/setting.dart';
import 'package:eateries/services/shared_preferences_service.dart';
import 'package:flutter/widgets.dart';

class SharedPreferencesProvider extends ChangeNotifier {
  final SharedPreferencesService _service;

  SharedPreferencesProvider(this._service);

  String _message = "";
  String get message => _message;

  Setting _setting = Setting(isDarkMode: false, isDailyReminderOn: false);
  Setting get setting => _setting;

  Future<void> saveSettingValue(Setting value) async {
    try {
      await _service.saveSettingValue(value);
      _setting = value;
      _message = "Your data is saved";
    } catch (e) {
      _message = "Failed to save your data";
    }
    notifyListeners();
  }

  Future<void> getSettingValue() async {
    try {
      _setting = _service.getSettingValue();
      _message = "Data successfully retrieved";
    } catch (e) {
      _message = "Failed to get your data";
    }
    notifyListeners();
  }

  Future<void> toggleDailyReminder(bool value) async {
    final updatedSetting = _setting.copyWith(isDailyReminderOn: value);
    await saveSettingValue(updatedSetting);
  }
}
