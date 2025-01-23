import 'package:sizer/sizer.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../home/data/model/order_model.dart';
import '../../../home/ui/manager/home_manager/home_cubit.dart';
import '../manager/receive_order_manager/receive_order_cubit.dart';

class Otp extends StatefulWidget {
  final OrderModel order;
  const Otp({super.key, required this.order});

  @override
  State<Otp> createState() => _OtpState();

  static final _defaultPinTheme = PinTheme(
    width: 14.w,
    height: 14.w,
    textStyle: AppText.semi20(),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4.w),
    ),
  );

  static final _focusedPinTheme = _defaultPinTheme.copyDecorationWith(
    boxShadow: [
      BoxShadow(
        color: Colors.green.shade200,
        blurRadius: 10,
        offset: Offset(0, 4.w),
      ),
    ],
  );

  static final _submittedPinTheme = _defaultPinTheme.copyDecorationWith(
    color: Colors.green.shade100,
  );
}

class _OtpState extends State<Otp> {
  String msg = "";
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReceiveOrderCubit, ReceiveOrderState>(
      listener: (context, state) async {
        if (state is ReceiveOrderFailure) {
          msg = state.error;
          // print(context.read<DeliveredCubit>().ordersLength);
        } else if (state is ReceiveOrderSuccess) {
          await context.read<HomeCubit>().getOrders();
          // await context.read<DeliveredCubit>().getDeliveredOrders(),
        }
      },
      builder: (context, state) {
        if (state is ReceiveOrderSuccess) {
          return Center(
            child: Text(
              state.success,
              style: AppText.medium17(Colors.green.shade800),
            ),
          );
        }
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            length: 5,
            autofocus: true,
            controller: _controller,
            validator: (val) {
              if (val == null) {
                return "Required";
              } else {
                return msg;
              }
            },
            autofillHints: const [],
            scrollPadding: EdgeInsets.all(4.w),
            errorBuilder: (errorText, pin) {
              return Padding(
                padding: EdgeInsets.only(top: 4.w),
                child: Center(
                  child: BlocBuilder<ReceiveOrderCubit, ReceiveOrderState>(
                    builder: (context, state) {
                      if (state is ReceiveOrderInitial) {
                        return Text(
                          msg,
                          style: AppText.semi16(Colors.green.shade900),
                        );
                      } else if (state is ReceiveOrderFailure) {
                        return Text(
                          msg,
                          style: AppText.semi16(Colors.red.shade700),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              );
            },
            onTapOutside: (val) =>
                FocusManager.instance.primaryFocus!.unfocus(),
            onCompleted: (pin) async {
              // print(context.read<DeliveredCubit>().test);
              // print(widget.currentOrder.id);

              await context.read<ReceiveOrderCubit>().receiveOrder(
                    otpCode: pin,
                    orderId: widget.order.id,
                  );
              _controller.text = "";
              // setState(() {});
            },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            defaultPinTheme: Otp._defaultPinTheme,
            focusedPinTheme: Otp._focusedPinTheme,
            submittedPinTheme: Otp._submittedPinTheme,
          ),
        );
      },
    );
  }

  // void doneMsg(BuildContext context, ReceiveOrderSuccess state) {
  //   showDialog(
  //     context: context,
  //     builder: (_) {
  //       return Dialog(
  //         backgroundColor: Colors.green.shade100,
  //         insetPadding: EdgeInsets.symmetric(horizontal: 6.w),
  //         child: Padding(
  //           padding: EdgeInsets.all(6.w),
  //           child: Column(
  //             spacing: 4.w,
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               CircleAvatar(
  //                 radius: 12.w,
  //                 backgroundColor: Colors.green.shade600,
  //                 child: Icon(
  //                   Icons.done_outline_rounded,
  //                   size: 28.sp,
  //                   color: Colors.green.shade50,
  //                 ),
  //               ),
  //               Text(
  //                 state.model.message ?? "Unknown",
  //                 style: AppText.medium17(Colors.green.shade800),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
