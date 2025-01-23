import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/helper/failure.dart';
import '../model/order_model.dart';
import '../model/order_response.dart';
import '../repo/delivered_order_repo.dart';
import '../../../../core/service/api_service.dart';
import '../../../../core/constant/const_string.dart';
import '../../../../core/service/local_service.dart';
import '../../../auth/data/model/login_data_model.dart';

class DeliveredOrderImpl implements DeliveredOrderRepo {
  const DeliveredOrderImpl._();
  static DeliveredOrderImpl? _instance;
  static final ApiService _service = ApiService.instance;
  static final LocalService _localService = LocalService.instance;
  static DeliveredOrderImpl get instance =>
      _instance ??= const DeliveredOrderImpl._();

  @override
  Future<Either<Failure, List<OrderModel>>> getDeliveredOrders() async {
    try {
      final LoginDataModel user = _invokeUserModel();
      final response = await _service.get(
        endPoint: ConstApi.deliveredOrdersEP,
        userId: user.id,
        userToken: user.token,
      );
      final model = OrderResponse.fromJson(response);
      if (model.status && model.data != null) {
        return right(model.data!.orders!);
      } else if (model.status == false) {
        return left(ResponseFailure(model.message));
      } else {
        return left(UnknownFailure("Oops... Unknown failure!"));
      }
    } on DioException catch (e) {
      return left(DioFailure(e));
    } catch (e) {
      return left(UnknownFailure("$e"));
    }
  }

  static LoginDataModel _invokeUserModel() =>
      _localService.get(ConstHive.userKey);
}
