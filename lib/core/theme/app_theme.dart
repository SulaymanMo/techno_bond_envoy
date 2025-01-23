import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'border_theme.dart';
import 'text_theme.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    // scaffoldBackgroundColor: Colory.dark.color,
    appBarTheme: AppBarTheme(
      titleSpacing: 6.w,
      titleTextStyle: AppText.semi20(),
    ),
    // ! _____ TabBar _____ ! //
    tabBarTheme: TabBarTheme(
      dividerHeight: 0,
      tabAlignment: TabAlignment.start,
      labelColor: Colors.green.shade800,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: Colors.grey.shade700,
      labelStyle: AppText.medium16(),
      unselectedLabelStyle: AppText.medium16(),
      labelPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: .5.w),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      indicator: ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(color: Colors.green.shade800, width: .3.w),
        ),
      ),
    ),
    // ! _____ Text Theme _____ ! //
    // textTheme: textTheme(),
    // ! _____ TextButton Theme _____ ! //
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        // foregroundColor: Colory.yellow.color,
        fixedSize: Size(double.infinity, 6.h),
        backgroundColor: Colors.green.shade50,
        foregroundColor: Colors.green.shade800,
        textStyle: AppText.medium15(),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(Colors.green.shade50),
    ),
    // ! _____ ElevatedButton Theme _____ ! //
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // elevation: 4.w,
        backgroundColor: Colors.green.shade100,
        foregroundColor: Colors.green.shade800,
        fixedSize: Size(double.infinity, 6.h),
        textStyle: AppText.semi16(),
      ),
    ),
    // ! _____ OutlinedButton Theme _____ ! //
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: OutlinedButton.styleFrom(
    //     fixedSize: Size(double.infinity, 5.5.h),
    //     textStyle: TextStyle(
    //       inherit: false,
    //       fontSize: 16.sp,
    //       letterSpacing: 0.2,
    //       fontWeight: FontWeight.w600,
    //     ),
    //     foregroundColor: Colory.yellow.color,
    //   ),
    // ),
    // ! _____ Input Theme _____ ! //
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.green.shade50,
      hintStyle: AppText.regular15(),
      labelStyle: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      ),
      floatingLabelStyle: AppText.semi16(),
      // iconColor: Colors.black,
      suffixIconColor: Colors.grey.shade800,
      prefixIconColor: Colors.grey.shade800,

      border: buildBorder(),
      enabledBorder: buildBorder(),
      disabledBorder: buildBorder(),
      focusedErrorBorder: buildBorder(),
      focusedBorder: buildFocusedBorder(),
    ),
    // ! _____ Icon Theme _____ ! //
    iconTheme: IconThemeData(
      size: 20.sp,
      color: Colors.grey.shade600,
    ),
    // ! _____ Card Theme _____ ! //
    cardTheme: CardTheme(
      elevation: .5,
      // color: Colors.white10,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.w),
      ),
      clipBehavior: Clip.hardEdge,
    ),
    // ! _____ ListTile Theme _____ ! //
    listTileTheme: ListTileThemeData(
      dense: false,
      minLeadingWidth: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.w),
      ),
      minVerticalPadding: 0,
      titleTextStyle: AppText.semi16(),
      subtitleTextStyle: AppText.bold14(),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.green.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.w),
      ),
      // backgroundColor: Colors.green.shade50,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      showDragHandle: true,
      dragHandleSize: Size(12.w, 1.25.w),
      backgroundColor: Colors.green.shade50,
      dragHandleColor: Colors.green.shade800,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6.w),
          topRight: Radius.circular(6.w),
        ),
      ),
    ),

    // dialogBackgroundColor: Colors.green.shade50,

    //  ! _____
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //     selectedIconTheme: IconThemeData(
    //       size: 21.sp,
    //       color: Colory.yellow.color,
    //     ),
    //     showSelectedLabels: true,
    //     showUnselectedLabels: false,
    //     type: BottomNavigationBarType.shifting,
    //     selectedLabelStyle: TextStyle(
    //       color: Colory.yellow.color,
    //     ),
    //     unselectedIconTheme: const IconThemeData(
    //       color: Colors.white70,
    //     ),
    //     unselectedLabelStyle: const TextStyle(
    //       color: Colors.white70,
    //     )),
  );
}
