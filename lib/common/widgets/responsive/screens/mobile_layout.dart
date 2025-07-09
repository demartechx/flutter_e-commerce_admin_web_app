import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/layouts/headers/headers.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/layouts/sidebars/sidebar.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key, this.body});

  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Scaffold(
              key: scaffoldKey,
              drawer: const TSidebar(),
              appBar: THeader(
                scaffoldKey: scaffoldKey,
              ),
              body: body ?? const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}
