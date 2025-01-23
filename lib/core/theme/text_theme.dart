import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final class AppText {
  static TextStyle bold15([Color? color]) {
    return GoogleFonts.ibmPlexSansArabic(
      height: 0,
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.green.shade700,
    );
  }

  static TextStyle regular15([Color? color]) {
    return GoogleFonts.ibmPlexSansArabic(
      height: 0,
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.grey.shade800,
    );
  }

  static TextStyle medium15([Color? color]) {
    return GoogleFonts.ibmPlexSansArabic(
      height: 0,
      fontSize: 15.5.sp,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.grey.shade800,
    );
  }

  static TextStyle medium18([Color? color]) {
    return GoogleFonts.ibmPlexSansArabic(
      height: 0,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.grey.shade900,
    );
  }

  static TextStyle medium17([Color? color]) {
    return GoogleFonts.ibmPlexSansArabic(
      height: 0,
      fontSize: 17.5.sp,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.grey.shade900,
    );
  }

  static TextStyle semi20([Color? color]) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 20.sp,
      height: 0,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.grey.shade600,
    );
  }

  static TextStyle bold14([Color? color]) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 14.sp,
      height: 0,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.grey.shade900,
    );
  }

  static TextStyle medium16([Color? color]) {
    return GoogleFonts.ibmPlexSansArabic(
      height: 0,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.grey.shade900,
    );
  }

  static TextStyle regular16([Color? color]) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      height: 0,
      color: color ?? Colors.grey.shade900,
    );
  }

  static TextStyle semi16([Color? color]) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.grey.shade900,
    );
  }
}
