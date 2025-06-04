import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/layouts/headers/headers.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/layouts/sidebars/sidebar.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key, this.body});

  final Widget? body;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
  child: SizedBox(
    height: MediaQuery.of(context).size.height,
    child: Scaffold(
      key: scaffoldKey,
      drawer: const TSidebar(),
      appBar: THeader(scaffoldKey: scaffoldKey,),
      body: IntrinsicHeight(
        child: body ?? const SizedBox(),
      ),
    ),
  ),
);
  }
}
