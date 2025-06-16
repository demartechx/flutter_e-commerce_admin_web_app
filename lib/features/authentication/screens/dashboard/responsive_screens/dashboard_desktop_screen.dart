
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/layouts/headers/headers.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:get/get.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: PaginatedDataTable2(
            columnSpacing: 12,
            minWidth: 786,
            dividerThickness: 0,
            horizontalMargin: 12,
            rowsPerPage: 12,
            dataRowHeight: 56,
            headingTextStyle: Theme.of(context).textTheme.titleMedium,
            headingRowColor: WidgetStateProperty.resolveWith((states) => TColors.primaryBackground),
            headingRowDecoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(TSizes.borderRadiusMd),
                topRight: Radius.circular(TSizes.borderRadiusMd),
              )
            ),
            columns: [
            DataColumn2(label: Text('Column 1')),
            DataColumn2(label: Text('Column 2')),
            DataColumn2(label: Text('Column 3')),
            DataColumn2(label: Text('Column 1'))
          ], 

          source: MyData(),
          
          
          // rows: [
          //   DataRow(cells: [
          //     DataCell(Text('Cell 1')),
          //     DataCell(Text('Cell 2')),
          //     DataCell(Text('Cell 3')),
          //     DataCell(Text('Cell 4')),
          //   ]),
          //   DataRow(cells: [
          //     DataCell(Text('Cell 5')),
          //     DataCell(Text('Cell 6')),
          //     DataCell(Text('Cell 7')),
          //     DataCell(Text('Cell 8')),
          //   ]),
          // ])
          
        //   Table(
        //     border: TableBorder.all(),
        //     children: [
        //       TableRow(
        //         //decoration: BoxDecoration(border: Border.all(color: Colors.greenAccent, width: 2)),
        //         children: [
        //           TableCell(child: Text('Cell 1')),
        //           TableCell(child: Text('Cell 2')),
        //         ]
        //       ),
        //       TableRow(
        //         //decoration: BoxDecoration(border: Border.all(color: Colors.greenAccent, width: 2)),
        //         children: [
        //           TableCell(child: Text('Cell 3')),
        //           TableCell(child: Text('Cell 4')),
        //         ]
        //       ),
        //     ],
        //   ),
        
        // ),
          )))
      );
  }
}



class MyData extends DataTableSource {
  final DashboardController controller = Get.put(DashboardController());

  @override
  DataRow? getRow(int index) {
    final data = controller.dataList[index];
    return DataRow2(cells: [
      DataCell(Text(data['Column1'] ?? '')),
      DataCell(Text(data['Column2'] ?? '')),
      DataCell(Text(data['Column3'] ?? '')),
      DataCell(Text(data['Column4'] ?? '')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.dataList.length;

  @override
  int get selectedRowCount => 0;

}


class DashboardController extends GetxController {
  var dataList = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDummyData();
  }

  void fetchDummyData() {
    dataList.addAll(
      List.generate(36, (index) => {
        'Column1': 'Data ${index + 1} - 1',
        'Column2': 'Data ${index + 1} - 2',
        'Column3': 'Data ${index + 1} - 3',
        'Column4': 'Data ${index + 1} - 4',
      })
    );
  }
}