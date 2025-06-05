import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/forgot_password/widgets/header_and_form.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';

class ForgotPasswordMobile extends StatelessWidget {
  const ForgotPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
      child: HeaderAndForm(),
      ),
    );
  }
}