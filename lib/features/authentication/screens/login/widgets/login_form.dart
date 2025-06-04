
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Padding(padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
    child: Column(
      children: [
        //Email
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            labelText: TTexts.email
          ),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields,),
    
        //password
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            labelText: TTexts.password,
            suffix: IconButton(onPressed: (){}, icon: Icon(Iconsax.eye_slash))
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
                Checkbox(value: true, onChanged: (value){}),
                Text(TTexts.rememberMe),
    
                
              ],
            ),
            //forget password
                TextButton(onPressed: (){}, child: Text(TTexts.forgetPassword))
    
          ],
        ),
        SizedBox(height: TSizes.spaceBtwSections,),
    
        /// Sign in Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: (){}, child: Text(TTexts.signIn)),
        )
    
      ],
    ),
    ));
  }
}