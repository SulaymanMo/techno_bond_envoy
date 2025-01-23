import 'order_model.dart';

class OrderData {
  final List<OrderModel>? currentOrder;
  final List<OrderModel>? orders;
  const OrderData({this.currentOrder, this.orders});

  factory OrderData.fromJson(Map<String, dynamic> json) {
    // ? Check the structure of "orders" to differentiate between the responses
    final orders = json['orders'];
    if (orders is Map<String, dynamic>) {
      // ! _____ Home response structure _____ ! //
      return OrderData(
        currentOrder: orders['current'] == null
            ? null
            : (orders['current'] as List?)
                ?.map((e) => OrderModel.fromJson(json['invoice_path'], e))
                .toList(),
        orders: (orders['available'] as List?)
            ?.map((e) => OrderModel.fromJson(json['invoice_path'], e))
            .toList(),
      );
    } else if (orders is List) {
      // ! _____ Delivered response structure _____ ! //
      return OrderData(
        orders: orders.isEmpty
            ? []
            : orders
                .map((e) => OrderModel.fromJson(json['invoice_path'], e))
                .toList(),
      );
    } else {
      throw Exception('Unexpected structure for "orders".');
    }
  }
}
