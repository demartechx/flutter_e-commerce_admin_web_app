import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/responsive/responsive_design.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/app_routes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/routes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'utils/constants/colors.dart';
import 'utils/constants/text_strings.dart';
import 'utils/device/web_material_scroll.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final Uri _productUri =
      Uri.parse('https://codingwitht.com/ecommerce-app-with-admin-panel/');

  Future<void> _openProductPage() async {
    // On web this will open a new tab automatically
    if (!await launchUrl(_productUri, webOnlyWindowName: '_blank')) {
      debugPrint('Could not launch $_productUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      getPages: TAppRoute.pages,
      initialRoute: TRoutes.responsiveDesignScreen, // TRoutes.firstScreen,
      unknownRoute: GetPage(
          name: '/page-not-found',
          page: () => Scaffold(
                body: Center(
                  child: Text('Page Not Found'),
                ),
              )),

      // scrollBehavior: MyCustomScrollBehavior(),
      // home: Scaffold(
      //   backgroundColor: TColors.primary,
      //   body: Center(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 32.0),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           const Text(
      //             '🎉 Starter Kit Ready! 🎉\n\n'
      //             'Your project structure is set up and running. Happy coding!',
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 20,
      //               height: 1.5,
      //               fontWeight: FontWeight.w500,
      //             ),
      //           ),
      //           const SizedBox(height: 40),
      //           MouseRegion(
      //             cursor: SystemMouseCursors.click,
      //             child: GestureDetector(
      //               onTap: _openProductPage,
      //               child: Container(
      //                 padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(8),
      //                 ),
      //                 child: const Row(
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: [
      //                     Icon(Icons.shopping_cart_outlined, color: TColors.primary),
      //                     SizedBox(width: 8),
      //                     Text(
      //                       'Get the Full E-Commerce App',
      //                       style: TextStyle(
      //                         color: TColors.primary,
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(desktop: Desktop());
  }
}

class Desktop extends StatelessWidget {
  const Desktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: TRoundedContainer(
          height: 450,
          backgroundColor: Colors.blue.withOpacity(0.2),
          child: const Center(child: Text("BOX 1")),
        ),
      ),
      // TRoundedContainer
      const SizedBox(width: 20),
      Expanded(
        child: TRoundedContainer(
          height: 450,
          backgroundColor: Colors.blue.withOpacity(0.2),
          child: const Center(child: Text('BOX 1')),
        ),
      ),
      // TRoundedContainer
      const SizedBox(width: 20),
      Expanded(
        flex: 2,
        child: TRoundedContainer(
          height: 450,
          backgroundColor: Colors.blue.withOpacity(0.2),
          child: const Center(child: Text('B0X 1')),
        ),
      ), // TRoundedContainer

      // SingleChildScrollView
    ]);
  }
}


