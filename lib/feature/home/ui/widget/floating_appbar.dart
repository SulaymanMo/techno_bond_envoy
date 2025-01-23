// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:sizer/sizer.dart';
// import '../../../details/ui/widget/show_details.dart';
// import '../../../details/ui/widget/show_pinput.dart';
// import '../../../../core/theme/text_theme.dart';
// import '../../../../lang/locale_keys.g.dart';
// import '../../data/model/order_model.dart';
// import '../manager/home_manager/home_cubit.dart';
// import '../../../../core/common/status_card.dart';

// class FloatingAppBar extends StatelessWidget {
//   static final double _radius = 2.w;
//   const FloatingAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<HomeCubit>();
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (_, state) {
//         if (state is HomeSuccess && read.isCurrent == true) {
//           return SliverAppBar(
//             snap: false,
//             pinned: true,
//             floating: true,
//             centerTitle: false,
//             expandedHeight: 13.h,
//             automaticallyImplyLeading: false,
//             backgroundColor: Colors.green.shade50,
//             title: Text(
//               state.data.currentOrder!.clientName,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: AppText.medium17(),
//             ),
//             flexibleSpace: FlexibleSpaceBar(
//               // title: GestureDetector(
//               //   onTap: () {
//               //     _showDetails(context, state.data.currentOrder!);
//               //   },
//               //   child: Text(
//               //     state.data.currentOrder!.clientName,
//               //     maxLines: 1,
//               //     overflow: TextOverflow.ellipsis,
//               //     style: AppText.medium17(),
//               //   ),
//               // ),
//               expandedTitleScale: 1.25,
//               background: InkWell(
//                 borderRadius: BorderRadius.circular(_radius),
//                 onTap: () {
//                   _showDetails(context, state.data.currentOrder!);
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(6.w, 4.w, 6.w, 4.w),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Icon(
//                                   Iconsax.mobile,
//                                   size: 20.sp,
//                                   color: Colors.green.shade900,
//                                 ),
//                                 SizedBox(width: 2.w),
//                                 Flexible(
//                                   child: Text(
//                                     state.data.currentOrder!.clientPhone,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: AppText.regular15(),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(width: 2.w),
//                           const StatusCard(status: "current"),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               titlePadding: EdgeInsets.fromLTRB(6.w, 4.w, 6.w, 4.w),
//             ),
//           );
//         } else if (state is HomeSuccess && read.isCurrent == false) {
//           return SliverToBoxAdapter(
//             child: SizedBox(
//               height: 13.5.h,
//               child: Center(
//                 child: Text(
//                   context.tr(LocaleKeys.noCurrent),
//                   style: AppText.medium17(Colors.grey.shade600),
//                 ),
//               ),
//             ),
//           );
//         } else {
//           return SliverToBoxAdapter(child: SizedBox(height: 13.h));
//         }
//       },
//     );
//   }

//   void _showDetails(BuildContext context, OrderModel order) {
//     showDetails(
//       context,
//       order: order,
//       status: "current",
//       isAvaliable: true,
//       onPressed: () {
//         showPinputDialog(
//           context,
//           order: order,
//           title: context.tr(LocaleKeys.enterOtp),
//           msg: context.tr(LocaleKeys.pleaseEnterOtp),
//         );
//       },
//     );
//   }
// }
