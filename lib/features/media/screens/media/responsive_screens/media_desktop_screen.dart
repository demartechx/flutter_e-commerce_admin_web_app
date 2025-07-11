import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/breadcrumbs/breadcrumbs.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/media/screens/media/widgets/media_uploader.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Breadcrumbs
                  TBreadcrumbsWithHeading(
                      heading: 'Media', breadcrumbItems: []),

                  SizedBox(
                      width: TSizes.buttonWidth * 1.5,
                      child: ElevatedButton.icon(
                          onPressed: () =>
                              controller.showImagesUploaderSection.value =
                                  !controller.showImagesUploaderSection.value,
                          icon: Icon(Iconsax.cloud),
                          label: Text('Upload Images')))
                ],
              ),

              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              MediaUploader()
            ],
          )),
    ));
  }
}
