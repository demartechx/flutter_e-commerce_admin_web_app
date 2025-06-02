import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/responsive/responsive_design.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/responsive/screens/desktop_layout.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/responsive/screens/mobile_layout.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/responsive/screens/tablet_layout.dart';

class TSiteTemplate extends StatelessWidget {
  const TSiteTemplate({super.key, this.desktop, this.tablet, this.mobile, this.useLayout = true});

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return TResponsiveWidget(
        desktop: useLayout ? DesktopLayout(
          body: desktop,
        ) : desktop ?? Container(),
        tablet: useLayout ?  TabletLayout(
          body: tablet ?? desktop,
        ) : tablet ?? desktop ?? Container(),
        mobile: useLayout ?  MobileLayout(
          body: mobile ?? desktop,
        ): mobile ?? desktop ?? Container()) ;
  }
}
