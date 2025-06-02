import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';

class TResponsiveWidget extends StatelessWidget {
  const TResponsiveWidget({super.key, required this.desktop, required this.tablet, required this.mobile});

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: LayoutBuilder(
            builder: (_, constraints) {
              if(constraints.maxWidth >= TSizes.desktopScreenSize){
                return desktop;

              } else if(constraints.maxWidth < TSizes.desktopScreenSize && constraints.maxWidth >= TSizes.tabletScreenSize){
                return tablet;
              }else{
               return mobile;
              }
            }
            )
        ),
      ),
    );
  }
}