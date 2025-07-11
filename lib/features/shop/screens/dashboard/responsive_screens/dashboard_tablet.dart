
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/shop/screens/dashboard/widgets/order_status_piechart.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/shop/screens/dashboard/widgets/weekly_sales.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';


class DashboardTabletScreen extends StatelessWidget {
  const DashboardTabletScreen({super.key});

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
              Row(
                children: [
                  Expanded(child: TDashboardCard(title: 'Sales total', subtitle: '\$365.6', stats: 25,)),
                  SizedBox(width: TSizes.spaceBtwItems,),
                  Expanded(child: TDashboardCard(title: 'Average Order Value', subtitle: '\$25', stats: 15,)),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwItems,),

              Row(
                children: [
                  Expanded(child: TDashboardCard(title: 'Total  Orders', subtitle: '\$36', stats: 44,)),
                  SizedBox(width: TSizes.spaceBtwItems,),
                  Expanded(child: TDashboardCard(title: 'Visitors', subtitle: '25,035', stats: 2,)),

                ],
              ),



              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TWeeklySalesGraph(),

              ///Orders
              TRoundedContainer(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Pie Chart
              OrderStatusPieChart(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          )),
      )
      );
  }
}

