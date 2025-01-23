import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      width: .8.sp,
      color: Colors.green.shade100,
    ),
    borderRadius: BorderRadius.circular(4.w),
  );
}

OutlineInputBorder buildFocusedBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      width: 2.5.sp,
      color: Colors.green.shade700,
    ),
    borderRadius: BorderRadius.circular(4.w),
  );
}
