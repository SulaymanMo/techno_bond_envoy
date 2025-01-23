import 'package:dio/dio.dart';
import '../repo/home_repo.dart';
import '../model/order_data.dart';
import 'package:dartz/dartz.dart';
import '../model/order_response.dart';
import '../../../../core/helper/failure.dart';
import '../../../../core/service/api_service.dart';
import '../../../../core/constant/const_string.dart';
import '../../../../core/service/local_service.dart';
import '../../../auth/data/model/login_data_model.dart';

class HomeImpl implements HomeRepo {
  const HomeImpl._();
  static HomeImpl? _instance;
  static final ApiService _apiService = ApiService.instance;
  static final LocalService _localService = LocalService.instance;
  static HomeImpl get instance => _instance ??= const HomeImpl._();

  @override
  Future<Either<Failure, OrderData>> fetchOrders(int? status) async {
    try {
      final LoginDataModel user = _invokeUserModel();
      final response = await _apiService.get(
        userId: user.id,
        endPoint:
            "${ConstApi.homeEP}${status != null ? "?status=$status" : ""}",
        userToken: user.token,
      );
      final model = OrderResponse.fromJson(response);
      if (model.status && model.data != null) {
        return right(model.data!);
      } else if (model.status == false) {
        return left(ResponseFailure(model.message));
      } else {
        return left(UnknownFailure("Sorry... try again later"));
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
