import 'package:dartz/dartz.dart';
import '../model/order_model.dart';
import '../../../../core/helper/failure.dart';

abstract class DeliveredOrderRepo {
  Future<Either<Failure, List<OrderModel>>> getDeliveredOrders();
}
