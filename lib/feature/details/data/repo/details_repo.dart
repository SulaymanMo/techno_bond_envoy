import 'package:dartz/dartz.dart';
import '../../../../core/helper/failure.dart';

abstract class DetailsRepo {
  Future<Either<Failure, void>> acceptOrder(int orderId);
  Future<Either<Failure, String>> receiveOrder(int orderId, String otpCode);
}
