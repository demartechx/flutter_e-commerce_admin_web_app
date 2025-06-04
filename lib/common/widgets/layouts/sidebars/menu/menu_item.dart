import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TMenuItem extends StatelessWidget {
  const TMenuItem({
    super.key, required this.route, required this.icon, required this.itemName,
  });

  final String route;
  final IconData icon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    final menuConroller = Get.put(SidebarController());

    return InkWell(
      onTap: () => menuConroller.menuOnTap(route),
      onHover: (hovering) => hovering ? menuConroller.changeHoverItem(route) : menuConroller.changeHoverItem(''),
      child: Obx(
        ()=> Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              color: menuConroller.isHovering(route) || menuConroller.isActive(route) ? TColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusMd)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Icon
                Padding(padding: EdgeInsets.only(left: TSizes.lg, top: TSizes.md, bottom: TSizes.md, right: TSizes.md),
                child: menuConroller.isActive(route) ? Icon(icon, size: 22, color: TColors.white,)  :
                
                Icon(icon, size: 22, color: menuConroller.isHovering(route) ? TColors.white : TColors.darkGrey,),
                ),
          
                //Text
                if(menuConroller.isHovering(route) || menuConroller.isActive(route))
                Flexible(child: Text(itemName, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),))
              else
               Flexible(child: Text(itemName, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.darkGrey),))
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}