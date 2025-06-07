import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/login/widgets/login_form.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';

class DashboardScreenMobile extends StatelessWidget {
  const DashboardScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // // Header
            // TLoginHeader(),
            // // Form
            // TLoginForm()
          ],
        ),
        
        ),
      );
  }
}