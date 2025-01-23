import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../repo/details_repo.dart';
import '../../../../core/helper/failure.dart';
import '../../../../core/service/api_service.dart';
import '../../../../core/constant/const_string.dart';
import '../../../../core/service/local_service.dart';
import '../../../home/data/model/order_response.dart';
import '../../../auth/data/model/login_data_model.dart';

class DetailsImpl implements DetailsRepo {
  const DetailsImpl._();
  static DetailsImpl? _instance;
  static final ApiService _service = ApiService.instance;
  static final LocalService _localService = LocalService.instance;
  static DetailsImpl get instance => _instance ??= const DetailsImpl._();

  @override
  Future<Either<Failure, void>> acceptOrder(int orderId) async {
    try {
      final LoginDataModel user = _invokeUserModel();

      final response = await _service.postWithHeader(
        endPoint: ConstApi.acceptEP,
        data: {"order": orderId},
        userId: user.id,
        userToken: user.token,
      );
      // print(response);
      if (response["status"] == true) {
        return right(null);
      } else {
        return left(
            UnknownFailure(response["message"] as String? ?? "Failed !"));
      }
    } on DioException catch (e) {
      return left(DioFailure(e));
    } catch (e) {
      return left(UnknownFailure("$e"));
    }
  }

  @override
  Future<Either<Failure, String>> receiveOrder(
      int orderId, String otpCode) async {
    try {
      final LoginDataModel user = _invokeUserModel();
      final response = await _service.postWithHeader(
        endPoint: ConstApi.receiveOrderEP,
        data: {"order": orderId, "otp_code": otpCode},
        userId: user.id,
        userToken: user.token,
      );
      final model = OrderResponse.fromJson(response);
      if (model.status == false) {
        return left(ResponseFailure(model.message));
      } else if (model.status == true) {
        return right(model.message);
      } else {
        return left(UnknownFailure(""));
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
