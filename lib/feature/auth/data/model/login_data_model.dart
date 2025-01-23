import 'package:hive_flutter/hive_flutter.dart';
part 'login_data_model.g.dart';

@HiveType(typeId: 0)
class LoginDataModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String phone;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final String token;

  const LoginDataModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
    required this.token,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      id: json['id'],
      name: json['name'],
      phone: "${json['phone']}",
      image: json['image'],
      token: json['token'],
    );
  }
}
