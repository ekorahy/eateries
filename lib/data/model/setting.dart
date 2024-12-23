class Setting {
  final bool isDarkMode;
  final bool isDailyReminderOn;

  Setting({
    required this.isDarkMode,
    required this.isDailyReminderOn,
  });

  Setting copyWith({
    bool? isDarkMode,
    bool? isDailyReminderOn,
  }) {
    return Setting(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isDailyReminderOn: isDailyReminderOn ?? this.isDailyReminderOn,
    );
  }
}
