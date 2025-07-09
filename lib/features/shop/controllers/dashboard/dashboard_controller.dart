import 'package:flutter_firebase_e_commerce_admin_panel/features/shop/model/order_model.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/enums.dart';
import 'package:flutter_firebase_e_commerce_admin_panel/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;

  /// -- Order
static final List<OrderModel> orders = [
  OrderModel(
    id: "CWT0012",
    status: OrderStatus.processing,
    totalAmount: 265,
    orderDate: DateTime(2025, 7, 1),
    deliveryDate: DateTime(2025, 7, 8),
  ),
  OrderModel(
    id: "CWT0025",
    status: OrderStatus.shipped,
    totalAmount: 369,
    orderDate: DateTime(2025, 7, 6),
    deliveryDate: DateTime(2025, 7, 6),
  ),
  OrderModel(
    id: "CWT0152",
    status: OrderStatus.delivered,
    totalAmount: 254,
    orderDate: DateTime(2025, 7, 7), // Fixed typo: year was 2824
    deliveryDate: DateTime(2025, 7, 7), // Fixed invalid month: 15
  ),
  OrderModel(
    id: "CHT0265",
    status: OrderStatus.delivered,
    totalAmount: 355,
    orderDate: DateTime(2025, 7, 8),
    deliveryDate: DateTime(2025, 7, 8),
  ),
  OrderModel(
    id: "CWT1536",
    status: OrderStatus.delivered,
    totalAmount: 115,
    orderDate: DateTime(2025, 7, 9),
    deliveryDate: DateTime(2025, 7, 9),
  ),
];


  @override
  void onInit() {
    _calculateWeeklySales();
    super.onInit();
  }

  // Calculate weekly sales
  void _calculateWeeklySales() {
    //Reset weekly sales to zeros
    weeklySales.value = List<double>.filled(7,0.0);

    for (var order in orders) {
      final DateTime orderWeekStart = THelperFunctions.getStartOfWeek(order.orderDate);
    
      // Check if the order is within the current week
      if(orderWeekStart.isBefore(DateTime.now()) && orderWeekStart.add(Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;

        // Ensure the index is non-negative
        index = index < 0 ? index + 7 : index;

        weeklySales[index] += order.totalAmount;

        //print('order Date: ${order.orderDate}');
      }
    }

    print('Weekly Sales: $weeklySales');
  }
}
