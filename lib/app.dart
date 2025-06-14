import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/bindings/general_bindings.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/app_routes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/routes.dart';
import 'package:get/get.dart';
import 'utils/constants/text_strings.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      getPages: TAppRoute.pages,
      initialRoute: TRoutes.login, // TRoutes.firstScreen,
      initialBinding: GeneralBindings(),
      unknownRoute: GetPage(
          name: '/page-not-found',
          page: () => Scaffold(
                body: Center(
                  child: Text('Page Not Found'),
                ),
              )),
    );
  }
}

