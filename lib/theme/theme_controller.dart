import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shoes_shop_app/theme/app_theme.dart';

class ThemeController extends GetxController {
  ThemeMode get theme => AppTheme.instance.theme;
}
