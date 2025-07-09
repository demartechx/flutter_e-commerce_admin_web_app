import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/shop/controllers/dashboard/dashboard_controller.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/device/device_utility.dart';
import 'package:get/get.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Cards
              Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: TDashboardCard(
                    title: 'Sales total',
                    subtitle: '\$365.6',
                    stats: 25,
                  )),
                  SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Expanded(
                      child: TDashboardCard(
                    title: 'Average Order Value',
                    subtitle: '\$25',
                    stats: 15,
                  )),
                  SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Expanded(
                      child: TDashboardCard(
                    title: 'Total  Orders',
                    subtitle: '\$36',
                    stats: 44,
                  )),
                  SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Expanded(
                      child: TDashboardCard(
                    title: 'Visitors',
                    subtitle: '25,035',
                    stats: 2,
                  )),
                ],
              ),

              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///GRAPHS
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        ///Bar Graph
                        TRoundedContainer(
                          child: Column(
                            children: [
                              Text(
                                'Weekly Sales',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              SizedBox(
                                height: TSizes.spaceBtwSections,
                              ),

                              //Graph
                              SizedBox(
                                height: 400,
                                child: BarChart(BarChartData(
                                    titlesData: buildFlTitleData(),
                                    borderData: FlBorderData(
                                        show: true,
                                        border: Border(
                                            top: BorderSide.none,
                                            right: BorderSide.none)),
                                    gridData: FlGridData(
                                        show: true,
                                        drawHorizontalLine: true,
                                        drawVerticalLine: false,
                                        horizontalInterval: 200),
                                    barGroups: controller.weeklySales
                                        .asMap()
                                        .entries
                                        .map((entry) => BarChartGroupData(
                                                x: entry.key,
                                                barRods: [
                                                  BarChartRodData(
                                                      width: 30,
                                                      toY: entry.value,
                                                      color: TColors.primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              TSizes.sm))
                                                ]))
                                        .toList(),
                                        groupsSpace: TSizes.spaceBtwItems,
                                        barTouchData: BarTouchData(
                                          touchTooltipData: BarTouchTooltipData(getTooltipColor: (_) => TColors.secondary,),
                                          touchCallback: TDeviceUtils.isDesktopScreen(context) ? (barTouchEvent, barTouchResponse) {} : null
                                        )
                                        )),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        ///Orders
                        TRoundedContainer()
                      ],
                    ),
                  ),

                  ///Pie Chart
                  Expanded(child: TRoundedContainer())
                ],
              )
            ],
          )),
    ));
  }

  buildFlTitleData() {
  return FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          // Map index to the desired day of the week
          final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

          // Calculate the index and ensure it wraps around for the correct day

          final index = value.toInt() % days.length;

          // Get the day corresponding to the calculated index
          final day = days[index];

          return SideTitleWidget(child: Text(day), meta: meta, space: 0,);
        },
      )
    ),
    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, interval: 200, reservedSize: 50)),
    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),

  );
}

}

