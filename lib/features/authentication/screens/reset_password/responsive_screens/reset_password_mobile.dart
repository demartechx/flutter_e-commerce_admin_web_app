
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/reset_password/widgets/reset_password_widget.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';

class ResetPasswordMobile extends StatelessWidget {
  const ResetPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child: ResetPasswordWidget(),
      ),
    );
  }
}