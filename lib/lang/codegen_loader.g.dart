// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "phone": "رقم الجوال",
  "password": "كلمة المرور",
  "rememberMe": "تذكرني",
  "continueAction": "متابعة",
  "hey": "مرحبًا",
  "noCurrent": "ليس هناك طلب قيد التوصيل",
  "letsTakeIt": "تسليم الطلب !",
  "counting": "جار العد",
  "results": "النتائج",
  "acceptAction": "أوافق",
  "allOrders": "كل الطلبات",
  "waitingOrder": "المنتظرة",
  "onDelivered": "قيد التوصيل",
  "delivered": "تم التوصيل",
  "unknownStatus": "حالة غير معروفة",
  "home": "الرئيسية",
  "settings": "الإعدادات",
  "enterOtp": "أدخل رمز التحقق !",
  "pleaseEnterOtp": "يرجى إدخال رمز التحقق هنا",
  "orderHistory": "سجل الطلبات",
  "trackDelivered": "تتبع الطلبات التي تم توصيلها",
  "updateInfo": "تحديث المعلومات",
  "accountSettings": "إعدادات الحساب",
  "language": "اللغة",
  "langSubtitle": "غيّر لغة التطبيق",
  "areYouSure": "هل أنت متأكد؟",
  "logout": "تسجيل الخروج",
  "logoutSubtitle": "سجّل خروجك بأمان",
  "cancel": "إلغاء",
  "overview": "الملاحظات",
  "overviewAfter": "الملاحظات بعد التسليم",
  "inProgress": "لديك طلب قيد التوصيل",
  "noAvailable": "لم يتم العثور على طلبات متاحة",
  "noDelivered": "لا يوجد طلبات تم توصيلها مسبقا",
  "checkoutDownloaded": "تم تنزيل الفاتورة",
  "technoBond": "تكنو بوند"
};
static const Map<String,dynamic> en = {
  "phone": "Phone",
  "password": "Password",
  "rememberMe": "Remember me",
  "continueAction": "Continue",
  "hey": "Hey",
  "counting": "Counting",
  "results": "Results",
  "noCurrent": "There is no order pending delivery",
  "acceptAction": "Accept !",
  "letsTakeIt": "Let's take it !",
  "allOrders": "All orders",
  "onDelivered": "Current order",
  "waitingOrder": "Available order",
  "delivered": "Delivered",
  "unknownStatus": "Unknown status",
  "home": "Home",
  "settings": "Settings",
  "enterOtp": "Enter OTP !",
  "pleaseEnterOtp": "Please enter your code here",
  "orderHistory": "Order history",
  "trackDelivered": "Track delivered orders",
  "updateInfo": "Update info",
  "accountSettings": "Account settings",
  "language": "Language",
  "langSubtitle": "Set app language",
  "areYouSure": "Are you sure ?",
  "logout": "Sign out",
  "logoutSubtitle": "Log out securely",
  "cancel": "Cancel",
  "overview": "Order overview",
  "overviewAfter": "Order overview after",
  "inProgress": "You have an order in progress",
  "noAvailable": "No available orders found",
  "noDelivered": "No orders have been delivered yet",
  "checkoutDownloaded": "Invoice downloaded",
  "technoBond": "Techno Bond"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
