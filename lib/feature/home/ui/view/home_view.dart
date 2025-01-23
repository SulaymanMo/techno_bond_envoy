import 'package:sizer/sizer.dart';

import '../../../../lang/locale_keys.g.dart';

import '../widget/home_sliver_list.dart';
import '../widget/welcome_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../manager/home_manager/home_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  int _selected = 0;
  late TabController _controller;

  final List<String> _tabs = [
    "كل الطلبات",
    "المنتظرة",
    "قيد التوصيل",
    "تم التوصيل",
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 4,
      vsync: this,
      initialIndex: _selected,
    );
    context.read<HomeCubit>().getOrders(null);
  }

  // Future<void> _listener() async {
  //   if (_controller.position.pixels <= 0.0) {
  //     _controller.removeListener(_listener);
  //     await context.read<HomeCubit>().getOrders();
  //   }
  // }

  // void _scroll() {
  //   if (context.read<AcceptOrderCubit>().state is AcceptOrderSuccess) {
  //     _controller.animateTo(
  //       0,
  //       curve: Curves.easeInOut,
  //       duration: const Duration(milliseconds: 500),
  //     );
  //   }
  // }

  @override
  void dispose() {
    _controller.dispose();
    // _controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<HomeCubit>();
    return RefreshIndicator(
      onRefresh: () async {
        await context
            .read<HomeCubit>()
            .getOrders(_selected == 0 ? null : _selected - 1);
      },
      child: Column(
        children: [
          WelcomeAppBar(
            title: "${context.tr(LocaleKeys.hey)}, ${read.getUser()?.name} 👋",
          ),
          TabBar(
            isScrollable: true,
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            controller: _controller,
            onTap: (val) async {
              if (val == _selected) return;
              _selected = val;
              await context
                  .read<HomeCubit>()
                  .getOrders(_selected == 0 ? null : _selected - 1);
            },
            tabs: List.generate(4, (i) => Tab(text: _tabs[i])),
          ),
          const Expanded(child: HomeSliverList()),
        ],
      ),
    );
  }

  // void _showDetails(BuildContext context, OrderModel order) {
  //   showDetails(
  //     context,
  //     order: order,
  //     status: "current",
  //     isAvaliable: true,
  //     onPressed: () {
  //       // showPinputDialog(
  //       //   context,
  //       //   order: order,
  //       //   title: context.tr(LocaleKeys.enterOtp),
  //       //   msg: context.tr(LocaleKeys.pleaseEnterOtp),
  //       // );
  //     },
  //   );
  // }

  // void _showAcceptTracker(BuildContext context) {
  //   showAdaptiveDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (_) {
  //       return BlocProvider<AcceptOrderCubit>.value(
  //         value: context.read<AcceptOrderCubit>(),
  //         child: Dialog(
  //           child: Padding(
  //             padding: EdgeInsets.all(6.w),
  //             child: BlocBuilder<AcceptOrderCubit, AcceptOrderState>(
  //               builder: (context, state) {
  //                 if (state is AcceptOrderFailure) {
  //                   return Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       Icon(Iconsax.danger, size: 32.sp),
  //                       SizedBox(height: 3.w),
  //                       Text(
  //                         state.error,
  //                         style: AppText.medium17(Colors.grey.shade600),
  //                       ),
  //                       SizedBox(height: 6.w),
  //                       Row(
  //                         children: [
  //                           Expanded(
  //                             child: OutlinedButton(
  //                               onPressed: () {
  //                                 context.nav.pop();
  //                               },
  //                               child: const Text("رجوع"),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   );
  //                 }
  //                 return SizedBox(
  //                   height: 20.h,
  //                   child: LottieBuilder.asset(ImgPath.loadingLottie),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}


/**
 [
            SliverToBoxAdapter(
              child: WelcomeAppBar(
                title:
                    "${context.tr(LocaleKeys.hey)}, ${read.getUser()?.name} 👋",
              ),
            ),
            // const CustomDivider(),
            // const HomeSliverList(),
          ],
 */