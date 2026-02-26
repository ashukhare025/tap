import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap/language/translations.dart';

import 'app/bottom_nevi/bottom_navi.dart';
import 'app/modules/profile/views/profile_view.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tap',
      // initialRoute: Routes.splash,
      getPages: AppPages.routes,
      translations: AppTranslations(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      home: ProfileView(),
    );
  }
}
