
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/routes/routes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class ResetPasswordWidget extends StatelessWidget {
   const ResetPasswordWidget({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final email = Get.parameters['email'] ?? '';

    return Column(
      children: [
        ///Header
        Row(
          children: [
            IconButton(onPressed: ()=> Get.offAllNamed(TRoutes.login), icon: Icon(CupertinoIcons.clear)),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems,),
    
        ///Image
        Image(image: AssetImage(TImages.deliveredEmailIllustration), width: 300, height: 300,),
        SizedBox(height: TSizes.spaceBtwItems,),
    
        //Title and subtitle
        Text(
          TTexts.changeYourPasswordTitle,
          style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,
        ),
        SizedBox(
          height: TSizes.spaceBtwSections * 2,
        ),
        Text(
          email,
          style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Text(
          TTexts.changeYourPasswordSubTitle,
          style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
    
        // Buttons
        SizedBox(width: double.infinity,
        child: ElevatedButton(onPressed: ()=>Get.offAllNamed(TRoutes.login), child: Text(TTexts.done)),
       
        ),
         SizedBox(height: TSizes.spaceBtwItems),
         SizedBox(width: double.infinity,
        child: TextButton(onPressed: (){}, child: Text(TTexts.resendEmail)),
       
        ),
      ],
    );
  }
}