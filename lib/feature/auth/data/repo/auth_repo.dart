import 'package:dartz/dartz.dart';
import '../model/login_model.dart';
import '../model/request_login.dart';
import '../../../../core/helper/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login(RequestLogin requestLogin);
}
