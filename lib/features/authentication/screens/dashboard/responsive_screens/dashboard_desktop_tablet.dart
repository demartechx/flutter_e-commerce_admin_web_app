
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/layouts/templates/login_template.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/login/widgets/login_form.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/login/widgets/login_header.dart';

class DashboardScreenDesktopTablet extends StatelessWidget {
  const DashboardScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return  TLoginTemplate(child: Column(
              children: [
                // //Header
                // TLoginHeader(),

                // // Form
                // TLoginForm()
              ],
            ),);
  }
}
