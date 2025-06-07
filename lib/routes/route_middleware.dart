import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/routes.dart';
import 'package:get/get.dart';

class TRouteMiddleware extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
      final isAuthenticated = AuthenticationRepository.instance.isAuthenticated;
      return isAuthenticated ? null : RouteSettings(name: TRoutes.login);
  }

}