
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/dashboard/responsive_screens/dashboard_desktop_screen.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/authentication/screens/dashboard/responsive_screens/dashboard_mobile.dart';

class DashbaordScreen extends StatelessWidget {
  const DashbaordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: DashboardDesktopScreen(), mobile: DashboardScreenMobile(),);
  }
}