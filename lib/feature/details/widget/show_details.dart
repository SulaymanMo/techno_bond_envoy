import 'dart:ui';
import 'package:sizer/sizer.dart';
import '../../../core/constant/colory.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/const_string.dart';
import '../../home/data/model/order_model.dart';
import '../view/details_bottom_sheet.dart';

void showDetails(
  BuildContext context, {
  required int status,
  required bool isAvaliable,
  required OrderModel order,
  required VoidCallback onPressed,
}) {
  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    showDragHandle: false,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: 75.h,
      minWidth: double.infinity,
    ),
    sheetAnimationStyle: AnimationStyle(
      duration: const Duration(milliseconds: ConstNum.duration),
      reverseDuration: const Duration(milliseconds: ConstNum.duration),
    ),
    backgroundColor: StatusColors.getColor(status, 0),
    builder: (_) {
      return Scaffold(
        body: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: DetailsBottomSheet(
            order: order,
            onPressed: () {},
            isAvailable: isAvaliable,
          ),
        ),
      );
    },
  );
}
