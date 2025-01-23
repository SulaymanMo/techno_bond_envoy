import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/const_string.dart';
import '../manager/receive_order_manager/receive_order_cubit.dart';

class Lotties extends StatelessWidget {
  const Lotties({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: BlocBuilder<ReceiveOrderCubit, ReceiveOrderState>(
        builder: (_, state) {
          if (state is ReceiveOrderInitial || state is ReceiveOrderFailure) {
            return LottieBuilder.asset(ImgPath.otpLottie);
          } else if (state is ReceiveOrderLoading) {
            return LottieBuilder.asset(ImgPath.loadingLottie);
          } else if (state is ReceiveOrderSuccess) {
            return LottieBuilder.asset(ImgPath.successLottie);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
