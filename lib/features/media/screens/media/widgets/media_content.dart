import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/media/screens/media/widgets/folder_dropdown.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/enums.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //Folder Dropdown
            Text(
              'Select Folder',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            MediaFolderDropdown(
              onChanged: (MediaCategory? newValue) {
                if (newValue != null) {
                  controller.selectedPath.value = newValue;
                }
              },
            ),
          ],
        ),

        SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        //Show media

        Wrap(
          alignment: WrapAlignment.start,
          spacing: TSizes.spaceBtwItems / 2,
          runSpacing: TSizes.spaceBtwItems / 2,
          children: [
            TRoundedImage(
              width: 90,
              height: 90,
              padding: TSizes.sm,
              imageType: ImageType.asset,
              image: TImages.darkAppLogo,
              backgroundColor: TColors.primaryBackground,
            ),
            TRoundedImage(
              width: 90,
              height: 90,
              padding: TSizes.sm,
              imageType: ImageType.asset,
              image: TImages.darkAppLogo,
              backgroundColor: TColors.primaryBackground,
            ),
            TRoundedImage(
              width: 90,
              height: 90,
              padding: TSizes.sm,
              imageType: ImageType.asset,
              image: TImages.darkAppLogo,
              backgroundColor: TColors.primaryBackground,
            ),
            TRoundedImage(
              width: 90,
              height: 90,
              padding: TSizes.sm,
              imageType: ImageType.asset,
              image: TImages.darkAppLogo,
              backgroundColor: TColors.primaryBackground,
            ),
            TRoundedImage(
              width: 90,
              height: 90,
              padding: TSizes.sm,
              imageType: ImageType.asset,
              image: TImages.darkAppLogo,
              backgroundColor: TColors.primaryBackground,
            ),
            TRoundedImage(
              width: 90,
              height: 90,
              padding: TSizes.sm,
              imageType: ImageType.asset,
              image: TImages.darkAppLogo,
              backgroundColor: TColors.primaryBackground,
            ),
            TRoundedImage(
              width: 90,
              height: 90,
              padding: TSizes.sm,
              imageType: ImageType.asset,
              image: TImages.darkAppLogo,
              backgroundColor: TColors.primaryBackground,
            ),
            TRoundedImage(
              width: 90,
              height: 90,
              padding: TSizes.sm,
              imageType: ImageType.asset,
              image: TImages.darkAppLogo,
              backgroundColor: TColors.primaryBackground,
            ),
            TRoundedImage(
              width: 90,
              height: 90,
              padding: TSizes.sm,
              imageType: ImageType.asset,
              image: TImages.darkAppLogo,
              backgroundColor: TColors.primaryBackground,
            ),
          ],
        ),

        ///Load More media button

        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: TSizes.buttonWidth,
              child: ElevatedButton.icon(
                onPressed: () {},
                label: const Text('Load More'),
                icon: const Icon(Iconsax.arrow_down),
              ), // ElevatedButton.icon
            ),
          ] // SizedBox
              ), // Row
        ), // Padding
      ],
    );
  }
}
