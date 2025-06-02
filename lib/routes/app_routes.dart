

import 'package:flutter_firebase_e_commerce_admin_panel/app.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/pages.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/route_middleware.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/routes.dart';
import 'package:get/get.dart';

class TAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.firstScreen, page: () => FirstScreen(), middlewares: [TRouteMiddleware()]),
    GetPage(name: TRoutes.secondScreen, page: () => SecondScreen(), middlewares: [TRouteMiddleware()]),
    GetPage(name: TRoutes.secondScreenWithUID, page: () => SecondScreen()),
    GetPage(name: TRoutes.responsiveDesignScreen, page: () => ResponsiveDesignScreen()),
  ];
}