import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppTranslation {
  static final AppTranslation instance = AppTranslation._internal();

  factory AppTranslation() {
    return instance;
  }

  AppTranslation._internal();

  static Locale english = const Locale('en', 'US');
  static Locale vietnamese = const Locale('vi', 'VN');

  final _box = GetStorage();
  final _key = 'isEnglish';

  /// Get isEnglish info from local storage and return ThemeMode
  Locale get language => _loadEnglishFromBox() ? english : vietnamese;

  /// Load isEnglish from local storage and if it's empty, returns false (that means default theme is light)
  bool _loadEnglishFromBox() => _box.read(_key) ?? false;

  /// Save isEnglish to local storage
  _saveLanguageToBox(bool isEnglish) => _box.write(_key, isEnglish);

  /// Switch theme and save to local storage
  Future switchLanguage() async {
    Get.updateLocale(_loadEnglishFromBox() ? vietnamese : english);
    await _saveLanguageToBox(!_loadEnglishFromBox());
    Get.appUpdate();
  }

  Future updateLanguage(Locale language) async {
    Get.updateLocale(language);
    await _saveLanguageToBox(language == english ? true : false);
    Get.appUpdate();
  }
}
