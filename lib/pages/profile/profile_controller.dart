import 'package:get/get.dart';
import 'package:shoes_shop_app/theme/app_theme.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';

class ProfileController extends GetxController {
  final tabIndex = 0.obs;
  final indexSelected = 0.obs;
  final theme = AppTheme.instance.theme.obs;
  final language = AppTranslation.instance.language.obs;
}
