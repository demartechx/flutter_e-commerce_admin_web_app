import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/media/screens/media/widgets/folder_dropdown.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/media/screens/media/widgets/media_content.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/enums.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/device/device_utility.dart';
import 'package:get/get.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    return Column(
      children: [
        Obx(
          ()=> controller.showImagesUploaderSection.value ? Column(
            children: [
              ///Drag and drop area
              TRoundedContainer(
                height: 250,
                showBorder: true,
                borderColor: TColors.borderPrimary,
                backgroundColor: TColors.primaryBackground,
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    Expanded(
                        child: Stack(
                      alignment: Alignment.center,
                      children: [
                        DropzoneView(
                          mime: const ['image/jpeg', 'image/png'],
                          cursor: CursorType.Default,
                          operation: DragOperation.copy,
                          onLoaded: () => print('Loaded'),
                          onError: (ev) => print('Error: $ev'),
                          onHover: () => print('Hover'),
                          onLeave: () => print('Leave'),
                          onCreated: (ctrl) =>
                              controller.dropzoneViewController = ctrl,
                          onDrop: (file) => print(file.name),
                          onDropInvalid: (ev) => print('Zone invalid MIME: $ev'),
                          onDropMultiple: (ev) => print('Zone drop multiple: $ev'),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              TImages.defaultMultiImageIcon,
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(
                              height: TSizes.spaceBtwItems,
                            ),
                            Text('Drag and Drop Images here'),
                            SizedBox(
                              height: TSizes.spaceBtwItems,
                            ),
                            OutlinedButton(
                                onPressed: () {}, child: Text('Select Images'))
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
          
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
          
              ///Locally selected Images
              TRoundedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Folders Dropdown
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
                            )
                          ],
                        ),
          
                        Row(
                          children: [
                            TextButton(onPressed: () {}, child: Text('Remove All')),
                            SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                            TDeviceUtils.isMobileScreen(context) ? SizedBox.shrink() :
                            SizedBox(
                              width: TSizes.buttonWidth,
                              child: ElevatedButton(onPressed: (){}, child: Text('Upload')))
                          ],
                        ),
          
                        
                      ],
                    ),
          
                    SizedBox(
                              height: TSizes.spaceBtwSections,
                            ),
          
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
          SizedBox(height: TSizes.spaceBtwSections,),
                        TDeviceUtils.isMobileScreen(context) ?
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(onPressed: (){}, child: Text('Upload'))) : SizedBox.shrink()
                  ],
                ),
              )
            ],
          ) : SizedBox.shrink(),
        ),

        SizedBox(height: TSizes.spaceBtwSections,),

        TRoundedContainer(child: MediaContent())
      ],
    );
  }
}
