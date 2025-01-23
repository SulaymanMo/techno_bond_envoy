import 'login_data_model.dart';

class LoginModel {
  final bool status;
  final String message;
  final LoginDataModel? data;

  const LoginModel({required this.status, required this.message, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      message: json['message'] ?? "",
      data: json['data'] == null ? null : LoginDataModel.fromJson(json['data']),
    );
  }
}
