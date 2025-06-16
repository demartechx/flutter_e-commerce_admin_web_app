
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/shimmers/shimmer.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/controllers/user_controller.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/enums.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/device/device_utility.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({super.key, this.scaffoldKey,});

  /// GlobalKey to access the Scaffold state
  final GlobalKey<ScaffoldState>? scaffoldKey;


  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

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
              Obx(
                ()=> TRoundedImage(
                  width: 40,
                  height: 40,
                  padding: 2,
                  imageType: controller.user.value.profilePicture.isNotEmpty ? ImageType.network : ImageType.asset, 
                  image: controller.user.value.profilePicture.isNotEmpty ? controller.user.value.profilePicture : TImages.user,),
              ),
                SizedBox(width: TSizes.sm,),

                //Name and Email
                if(!TDeviceUtils.isMobileScreen(context))
                Obx(
                  ()=> Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      controller.loading.value ?
                      TShimmerEffect(width: 50, height: 13) :
                      Text(controller.user.value.fullName, style: Theme.of(context).textTheme.titleLarge,),
                      controller.loading.value ?
                      TShimmerEffect(width: 50, height: 13) :
                      Text(controller.user.value.email, style: Theme.of(context).textTheme.labelMedium,),
                    ],
                  ),
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