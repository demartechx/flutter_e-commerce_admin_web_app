import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/routes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HeaderAndForm extends StatelessWidget {
  const HeaderAndForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Header
        IconButton(
            onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left)),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
    
        Text(
          TTexts.forgetPasswordTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Text(
          TTexts.forgetPasswordSubTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(
          height: TSizes.spaceBtwSections * 2,
        ),
    
        /// Form
        
        Form(child: TextFormField(
          decoration: InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
    
        )),
        SizedBox(
          height: TSizes.spaceBtwSections * 2,
        ),
    
        //Submit button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: ()=> Get.toNamed(TRoutes.resetPassword, parameters: {'email': 'adeagbothompson@gmail.com'}), child: Text(TTexts.submit)),
        )
      
      ],
    );
  }
}
