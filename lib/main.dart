import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_shop_app/config/flavor_config.dart';
import 'package:shoes_shop_app/services/api_token.dart';
import 'package:shoes_shop_app/theme/app_theme.dart';
import 'package:shoes_shop_app/translations/app_translation.dart';
import 'package:shoes_shop_app/translations/locale_string.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  FlavorConfig(
    values: FlavorValues(
      baseUrl: 'http://192.168.1.8:3000/api',
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runZoned<Future<Null>>(() async {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(
        () {},
      ),
      initialRoute:
          ApiToken.to.isTokenExisted ? AppRoutes.DASHBORAD : AppRoutes.SPLASH,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: AppTranslation.instance.language,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: AppTheme.instance.theme,
    );
  }
}
