
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/enums.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/device/device_utility.dart';
import 'package:iconsax/iconsax.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({super.key, this.scaffoldKey,});

  /// GlobalKey to access the Scaffold state
  final GlobalKey<ScaffoldState>? scaffoldKey;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColors.white,
        border: Border(
          bottom: BorderSide(color: TColors.grey, width: 1)
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
      child: AppBar(
        ///Mobile view
        leading: !TDeviceUtils.isDesktopScreen(context) ? IconButton(onPressed: ()=> scaffoldKey?.currentState?.openDrawer(), icon: Icon(Iconsax.menu)) : null,
        
        /// Search field
        title: TDeviceUtils.isDesktopScreen(context) ? 
        SizedBox(width: 400, child: TextFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.search_normal), hintText: 'Search anything...'),
        ),) : null,

        /// Actions
        actions: [
          //search Icon on Mobile
          if(!TDeviceUtils.isDesktopScreen(context)) IconButton(onPressed: (){}, icon: Icon(Iconsax.search_normal)),

          //Notification Icon
          IconButton(onPressed: (){ AuthenticationRepository.instance.logout(); }, icon: Icon(Iconsax.notification)),

          SizedBox(width: TSizes.spaceBtwItems / 2,),

          // User Data
          Row(
            children: [
              TRoundedImage(
                width: 40,
                height: 40,
                padding: 2,
                imageType: ImageType.asset, image: TImages.user,),
                SizedBox(width: TSizes.sm,),

                //Name and Email
                if(!TDeviceUtils.isMobileScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Coding with D', style: Theme.of(context).textTheme.titleLarge,),
                    Text('demartechx@gmail.com', style: Theme.of(context).textTheme.labelMedium,),
                  ],
                )
            ],
          )
        
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight() + 15);
}