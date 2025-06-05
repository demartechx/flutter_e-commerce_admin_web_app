
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/layouts/templates/login_template.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/reset_password/widgets/reset_password_widget.dart';


class ResetPasswordDesktopTablet extends StatelessWidget {
  const ResetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return TLoginTemplate(child: ResetPasswordWidget());
  }
}
