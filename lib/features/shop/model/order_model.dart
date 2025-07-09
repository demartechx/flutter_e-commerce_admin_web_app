import 'package:flutter_firebase_e_commerce_admin_panel/utils/constants/enums.dart';

class OrderModel {
  final String id;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final DateTime deliveryDate;

  OrderModel({
    required this.id,
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    required this.deliveryDate,
  });
}
