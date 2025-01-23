import 'package:intl/intl.dart';

class OrderModel {
  final int id, status;
  final String invoice, notesBefore, createdDate, clientName, clientPhone;

  const OrderModel({
    required this.id,
    required this.status,
    required this.invoice,
    required this.notesBefore,
    required this.createdDate,
    required this.clientName,
    required this.clientPhone,
  });

  factory OrderModel.fromJson(String invoicePath, Map<String, dynamic> json) {
    String formatDateTime(String? dateTimeString) {
      if (dateTimeString == null) {
        return "No date provided";
      }
      try {
        final dateTime = DateTime.parse(dateTimeString);
        final formattedDate = DateFormat('d, MMMM | h:mm a').format(dateTime);
        return formattedDate;
      } catch (e) {
        return "Invalid date format";
      }
    }

    return OrderModel(
      id: json['id'],
      status: json['status'],
      invoice: "$invoicePath${json['invoice']}",
      notesBefore: "${json['notes_before'] ?? ""}",
      createdDate:
          json['created_date'] ?? formatDateTime(json['delivery_date']) ?? "",
      clientName: json['client_name'],
      clientPhone: "+${json['country_code']}${json['client_phone']}",
    );
  }
}
