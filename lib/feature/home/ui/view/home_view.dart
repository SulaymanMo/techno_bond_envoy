import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:techno_bond_envoy/core/constant/extension.dart';
import '../../../../core/common/failure_widget.dart';
import '../../../../core/constant/const_string.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../details/ui/manager/accept_order_manager/accept_order_cubit.dart';
import '../../../details/ui/widget/show_details.dart';
import '../../../details/ui/widget/show_pinput.dart';
import '../../data/model/order_model.dart';
import '../widget/card_loading.dart';
import '../widget/custom_divider.dart';
import '../widget/list_item.dart';
import '../widget/welcome_appbar.dart';
import 'package:flutter/material.dart';
import '../widget/home_sliver_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../manager/home_manager/home_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  Future<void> _listener() async {
    if (_controller.position.pixels <= 0.0) {
      _controller.removeListener(_listener);
      await context.read<HomeCubit>().getOrders();
    }
  }

  void _scroll() {
    if (context.read<AcceptOrderCubit>().state is AcceptOrderSuccess) {
      _controller.animateTo(
        0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<HomeCubit>();
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<HomeCubit>().getOrders();
      },
      child: BlocListener<AcceptOrderCubit, AcceptOrderState>(
        listener: (context, state) async {
          if (state is AcceptOrderLoading) {
            _showAcceptTracker(context);
          } else if (state is AcceptOrderSuccess) {
            if (context.mounted) {
              _scroll();
              _controller.addListener(_listener);
              await Future.delayed(const Duration(milliseconds: 500));
              if (context.mounted) {
                context.nav.pop();
              }
            }
          }
        },
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverToBoxAdapter(
              child: WelcomeAppBar(
                title:
                    "${context.tr(LocaleKeys.hey)}, ${read.getUser()?.name} 👋",
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(6.w),
              sliver: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    final orders = state.data.currentOrder;
                    if (orders != null && orders.isNotEmpty) {
                      return SliverList.separated(
                        itemCount: orders.length,
                        itemBuilder: (_, index) {
                          return ListItem(
                            status: "current",
                            order: orders[index],
                            onTap: () {
                              _showDetails(context, orders[index]);
                            },
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(height: 3.w),
                      );
                    } else {
                      return SliverToBoxAdapter(
                        child: Column(
                          spacing: 3.w,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 3.w),
                            Icon(Iconsax.folder_cloud, size: 38.sp),
                            Text(
                              context.tr(LocaleKeys.noAvailable),
                              style: AppText.medium16(Colors.grey.shade600),
                            ),
                          ],
                        ),
                      );
                    }
                  } else if (state is HomeLoading || state is HomeInitial) {
                    return SliverList.separated(
                      itemCount: 6,
                      itemBuilder: (_, index) => const CardLoading(),
                      separatorBuilder: (_, index) => SizedBox(height: 3.w),
                    );
                  } else if (state is HomeFailure) {
                    return SliverToBoxAdapter(
                      child: FailureWidget(error: state.error),
                    );
                  } else {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ),
            // const FloatingAppBar(),
            const CustomDivider(),
            const HomeSliverList(),
          ],
        ),
      ),
    );
  }

  void _showDetails(BuildContext context, OrderModel order) {
    showDetails(
      context,
      order: order,
      status: "current",
      isAvaliable: true,
      onPressed: () {
        showPinputDialog(
          context,
          order: order,
          title: context.tr(LocaleKeys.enterOtp),
          msg: context.tr(LocaleKeys.pleaseEnterOtp),
        );
      },
    );
  }

  void _showAcceptTracker(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return BlocProvider<AcceptOrderCubit>.value(
          value: context.read<AcceptOrderCubit>(),
          child: Dialog(
            child: Padding(
              padding: EdgeInsets.all(6.w),
              child: BlocBuilder<AcceptOrderCubit, AcceptOrderState>(
                builder: (context, state) {
                  if (state is AcceptOrderFailure) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Iconsax.danger, size: 32.sp),
                        SizedBox(height: 3.w),
                        Text(
                          state.error,
                          style: AppText.medium17(Colors.grey.shade600),
                        ),
                        SizedBox(height: 6.w),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  context.nav.pop();
                                },
                                child: const Text("رجوع"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  return SizedBox(
                    height: 20.h,
                    child: LottieBuilder.asset(ImgPath.loadingLottie),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
