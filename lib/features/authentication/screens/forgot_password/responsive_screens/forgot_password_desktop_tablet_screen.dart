import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/layouts/templates/login_template.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/forgot_password/widgets/header_and_form.dart';


class ForgotPasswordDesktopTablet extends StatelessWidget {
  const ForgotPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return TLoginTemplate(
      child: HeaderAndForm(),
    );
  }
}

