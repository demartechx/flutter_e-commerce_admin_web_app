import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/layouts/headers/headers.dart';

class DesktopLayout extends StatelessWidget {
  DesktopLayout({super.key, this.body});
  final Widget? body;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
  child: ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height,
    ),
    child: IntrinsicHeight(
      child: Scaffold(
        body: Row(children: [
      const Expanded(child: Drawer()),
      Expanded(
        flex: 5,
        child: Column(children: [
        //HEADER
          THeader(),
          //I BODY
          body ?? const SizedBox()
        ]),
      ),
    ]))

    ),
  ),
    );

    
    
  }
}


