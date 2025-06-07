
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/controllers/login_controller.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/routes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/text_strings.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
    child: Column(
      children: [
        //Email
        TextFormField(
          controller: controller.email,
          validator: TValidator.validateEmail,
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            labelText: TTexts.email
          ),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields,),
    
        //password
        Obx(
          ()=> TextFormField(
            controller: controller.password,
            validator: (value) => TValidator.validateEmptyText('Password', value),
            obscureText: controller.hidePassword.value,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: TTexts.password,
              suffix: IconButton(onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value, icon: Icon( controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))
            ),
          ),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields / 2,),
    
        /// Remember me & forget password
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Remember me
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(()=> Checkbox(value: controller.rememberMe.value, onChanged: (value)=> controller.rememberMe.value = value!)),
                Text(TTexts.rememberMe),
    
                
              ],
            ),
            //forget password
                TextButton(onPressed: ()=> Get.toNamed(TRoutes.forgetPassword), child: Text(TTexts.forgetPassword))
    
          ],
        ),
        SizedBox(height: TSizes.spaceBtwSections,),
    
        /// Sign in Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: ()=> controller.registerAdmin(), child: Text(TTexts.signIn)),
        )
    
      ],
    ),
    ));
  }
}