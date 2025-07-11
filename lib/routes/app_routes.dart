

import 'package:flutter_firebase_e_commerce_admin_panel/features/media/screens/media/media.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/shop/screens/dashboard/dashbaord.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/forgot_password/forgot_password.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/login/login.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/reset_password/reset_password.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/route_middleware.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/routes.dart';
import 'package:get/get.dart';

class TAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.login, page: () => LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: TRoutes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(name: TRoutes.dashboard, page: () => DashbaordScreen(), middlewares: [TRouteMiddleware()]),
    GetPage(name: TRoutes.media, page: () => MediaScreen(), middlewares: [TRouteMiddleware()]),

  ];
}