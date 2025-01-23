import 'package:dartz/dartz.dart';
import '../model/order_data.dart';
import '../../../../core/helper/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, OrderData>> fetchOrders();
}
