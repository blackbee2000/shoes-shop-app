import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_shop_app/theme/theme_controller.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

class AppTheme {
  static final AppTheme instance = AppTheme._internal();

  factory AppTheme() {
    return instance;
  }

  AppTheme._internal();

  static ThemeData light = lightTheme;
  static ThemeData dark = darkTheme;

  final _box = GetStorage();
  final _key = 'isDarkMode';

  var brightness = SchedulerBinding.instance!.window.platformBrightness;

  final controller = Get.put(ThemeController());

  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  bool _loadThemeFromBox() => _box.read(_key) ?? brightness == Brightness.dark;

  /// Save isDarkMode to local storage
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Switch theme and save to local storage
  Future switchTheme() async {
    Get.changeTheme(_loadThemeFromBox() ? light : dark);
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    await _saveThemeToBox(!_loadThemeFromBox());
    controller.update();
  }
}
