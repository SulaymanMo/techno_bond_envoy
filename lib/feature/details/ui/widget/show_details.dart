import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:techno_bond_envoy/core/constant/extension.dart';
import '../../../../core/constant/colory.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/const_string.dart';
import '../../../home/data/model/order_model.dart';
import '../manager/accept_order_manager/accept_order_cubit.dart';
import '../view/details_bottom_sheet.dart';

void showDetails(
  BuildContext context, {
  required String status,
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
        body: BlocProvider<AcceptOrderCubit>.value(
          value: context.read<AcceptOrderCubit>(),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: DetailsBottomSheet(
              order: order,
              status: status,
              onPressed: () async {
                context.nav.pop();
                await Future.delayed(
                  const Duration(milliseconds: ConstNum.duration),
                  () {
                    onPressed();
                  },
                );
              },
              isAvailable: isAvaliable,
            ),
          ),
        ),
      );
    },
  );
}

// void showDelivered(
//   BuildContext context, {
//   required String status,
//   required String btnTitle,
//   required DeliveredOrderModel order,
//   required void Function() onPressed,
// }) {
//   showModalBottomSheet(
//     context: context,
//     useSafeArea: true,
//     showDragHandle: false,
//     isScrollControlled: true,
//     backgroundColor: StatusColors.getColor(status, 0),
//     builder: (context) {
//       return BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
//         child: DeliveredDetailsBottomSheet(
//           status: status,
//           btnTitle: btnTitle,
//           onPressed: onPressed,
//           order: order,
//         ),
//       );
//     },
//   );
// }
