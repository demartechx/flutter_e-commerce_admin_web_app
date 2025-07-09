
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';


class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dashboard', style: Theme.of(context).textTheme.headlineLarge,),
              SizedBox(height: TSizes.spaceBtwSections,),

              //Cards
              TDashboardCard(title: 'Sales total', subtitle: '\$365.6', stats: 25,),
              SizedBox(height: TSizes.spaceBtwItems,),
              TDashboardCard(title: 'Average Order Value', subtitle: '\$25', stats: 15,),
              SizedBox(height: TSizes.spaceBtwItems,),
              TDashboardCard(title: 'Total  Orders', subtitle: '\$36', stats: 44,),
              SizedBox(height: TSizes.spaceBtwItems,),
              TDashboardCard(title: 'Visitors', subtitle: '25,035', stats: 2,),
            ],
          )),
      )
      );
  }
}

