

// class OtpImpl implements OtpRepo {
//   const OtpImpl._();
//   static OtpImpl? _instance;
//   static final ApiService _service = ApiService.instance;
//   static final LocalService _localService = LocalService.instance;
//   static OtpImpl get instance => _instance ??= const OtpImpl._();

//   @override
//   Future<Either<Failure, AvailableOrdersModel>> receiveOrder(
//       int orderId, String otpCode) async {
//     try {
//       final LoginDataModel user = _invokeUserModel();

//       final response = await _service.postWithHeader(
//         endPoint: ConstApi.receiveOrderEP,
//         data: {"order": orderId, "otp_code": otpCode},
//         userId: user.id,
//         userToken: user.token,
//       );
//       if (response["status"] == false) {
//         return left(UnknownFailure(
//             response["message"] as String? ?? "Some thing went wrong!"));
//       }
//       final model = AvailableOrdersModel.fromJson(response);
//       return right(model);
//     } on DioException catch (e) {
//       return left(DioFailure(e));
//     } catch (e) {
//       return left(UnknownFailure("$e"));
//     }
//   }

//   static LoginDataModel _invokeUserModel() =>
//       _localService.get(ConstHive.userKey);
// }
