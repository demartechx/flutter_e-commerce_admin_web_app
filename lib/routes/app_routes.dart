

import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/login/login.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/route_middleware.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/routes.dart';
import 'package:get/get.dart';

class TAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.login, page: () => LoginScreen(), middlewares: [TRouteMiddleware()]),

  ];
}