
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/text_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(width: 100, height: 100, image: AssetImage(TImages.darkAppLogo), ),
          SizedBox(height: TSizes.spaceBtwSections,),
          Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: TSizes.sm,),
          Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium,),
    
        ],
      ),
    );
  }
}
