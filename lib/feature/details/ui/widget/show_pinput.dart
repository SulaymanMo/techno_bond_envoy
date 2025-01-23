import 'dart:ui';
import '../../../home/ui/manager/home_manager/home_cubit.dart';
import '../view/otp.dart';
import 'lotties.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/text_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/data/model/order_model.dart';
import '../manager/receive_order_manager/receive_order_cubit.dart';

void showPinputDialog(
  BuildContext context, {
  String? title,
  required String msg,
  required OrderModel order,
}) {
  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 6.w),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Padding(
            padding: EdgeInsets.all(6.w),
            child: MultiBlocProvider(
              providers: [
                BlocProvider<ReceiveOrderCubit>(
                  create: (context) => ReceiveOrderCubit(),
                ),
                BlocProvider<HomeCubit>.value(
                  value: context.read<HomeCubit>(),
                ),
                // BlocProvider<DeliveredCubit>.value(
                //   value: context.read<DeliveredCubit>(),
                // ),
              ],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Lotties(),
                  SizedBox(height: 2.w),
                  BlocBuilder<ReceiveOrderCubit, ReceiveOrderState>(
                    builder: (context, state) {
                      if (state is ReceiveOrderSuccess) {
                        return const SizedBox.shrink();
                      }
                      return Text(
                        title ?? "Notice!",
                        style: AppText.medium18(),
                      );
                    },
                  ),
                  SizedBox(height: 3.w),
                  Otp(order: order),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
