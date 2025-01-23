import 'package:flutter/widgets.dart';

// ! _____ Hive _____ ! //
final class ConstHive {
  static const String defaultBox = "default_box";
  static const String userKey = "user_key";
}

// ! _____ Localization _____ ! //
final class ConstLang {
  static const Locale en = Locale("en");
  static const Locale ar = Locale("ar");

  static const String langPath = "assets/langs";
}

// ! _____ Routes _____ ! //
class RoutePath {
  static const String login = "/login";
  static const String home = "/home";
}

// ! _____ Images _____ ! //
final class ImgPath {
  static const String logo = "assets/images/logo.png";
  static const String otpLottie = "assets/animation/otp.json";
  static const String loadingLottie = "assets/animation/loading.json";
  static const String successLottie = "assets/animation/success.json";
  // static const String loadingLottie = "assets/animation/loading.json";
  // static const String successLottie = "assets/animation/success.json";
}

// ! _____ Apis _____ ! //
final class ConstApi {
  static const String baseUrl = "https://technobond.net/classes/api";
  static const String secretKey = "Bearer 96437f7bc5f8d7c2149bad018e545eec";
  static const String loginEP = "sales/auth/login";
  static const String homeEP = "sales/home";
  static const String acceptEP = "sales/orders/accept";
}

final class ConstNum {
  static const int duration = 250;
}
