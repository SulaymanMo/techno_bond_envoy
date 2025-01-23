import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/constant/const_string.dart';
import '../../../../core/helper/failure.dart';
import '../../../../core/service/api_service.dart';
import '../../../../core/service/local_service.dart';
import '../model/login_data_model.dart';
import '../model/login_model.dart';
import '../model/request_login.dart';
import 'auth_repo.dart';

class AuthImpl implements AuthRepo {
  const AuthImpl._();
  static AuthImpl? _instance;
  static final ApiService _apiService = ApiService.instance;
  static final LocalService _localService = LocalService.instance;
  static AuthImpl get instance => _instance ??= const AuthImpl._();

  @override
  Future<Either<Failure, LoginModel>> login(RequestLogin requestLogin) async {
    try {
      final response = await _apiService.post(
        endPoint: ConstApi.loginEP,
        data: requestLogin.toJson(),
      );
      final LoginModel model = LoginModel.fromJson(response);
      if (model.status && model.data != null) {
        await _localService.save<LoginDataModel>(
          key: ConstHive.userKey,
          value: model.data!,
        );
        return right(model);
      } else if (model.message.isNotEmpty) {
        return left(ResponseFailure(model.message));
      } else {
        return left(UnknownFailure("Oops... Something went wrong!"));
      }
    } on DioException catch (e) {
      return left(DioFailure(e));
    } catch (e) {
      return left(UnknownFailure("$e"));
    }
  }
}
