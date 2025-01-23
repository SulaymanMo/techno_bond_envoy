final class RequestLogin {
  final String phone, password;
  const RequestLogin({required this.phone, required this.password});

  Map<String, dynamic> toJson() {
    return {"phone": phone, "password": password};
  }
}
