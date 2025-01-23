import 'package:sizer/sizer.dart';
import '../theme/text_theme.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController showMsg(
  BuildContext context, {
  Color? color,
  required String msg,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.w),
      backgroundColor: color ?? Colors.red.shade600,
      content: Text(msg, style: AppText.medium16(Colors.white)),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
