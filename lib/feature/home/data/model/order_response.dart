import 'order_data.dart';

class OrderResponse {
  final bool status;
  final String message;
  final OrderData? data;

  const OrderResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      status: json['status'],
      message: json['message'] ?? "",
      data: json['data'] == null ? null : OrderData.fromJson(json['data']),
    );
  }
}
