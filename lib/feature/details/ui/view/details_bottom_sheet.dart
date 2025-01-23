import 'package:sizer/sizer.dart';
import '../../../../lang/locale_keys.g.dart';
import '../widget/file_section.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/colory.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/common/status_card.dart';
import '../../../home/data/model/order_model.dart';
import '../../../../core/common/info_section.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widget/notice.dart';

class DetailsBottomSheet extends StatelessWidget {
  final String status;
  final bool isAvailable;
  final OrderModel order;
  final void Function() onPressed;

  const DetailsBottomSheet({
    super.key,
    required this.status,
    required this.order,
    required this.onPressed,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 6.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            child: Container(
              alignment: Alignment.center,
              width: 12.w,
              height: 1.25.w,
              margin: EdgeInsets.fromLTRB(4.w, 6.w, 4.w, 4.w),
              decoration: BoxDecoration(
                color: StatusColors.getColor(status, 2),
                borderRadius: BorderRadius.circular(4.w),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [StatusCard(status: status)],
          ),
          SizedBox(height: .5.h),
          InfoSection(
            order: order,
            status: status,
            style: AppText.medium18(Colors.black),
          ),
          SizedBox(height: 2.w),
          FileSection(status: status, order: order),
          SizedBox(height: 4.w),
          Text(context.tr(LocaleKeys.overview), style: AppText.medium16()),
          SizedBox(height: 2.w),
          Notice(order: order, status: status),
        ],
      ),
    );
  }
}

// class DeliveredDetailsBottomSheet extends StatelessWidget {
//   final String status;
//   final String btnTitle;
//   final DeliveredOrderModel order;
//   final void Function() onPressed;

//   const DeliveredDetailsBottomSheet({
//     super.key,
//     required this.status,
//     required this.btnTitle,
//     required this.onPressed,
//     required this.order,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 6.w),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               width: 12.w,
//               height: 1.2.w,
//               margin: EdgeInsets.only(top: 6.w, bottom: 4.w),
//               decoration: BoxDecoration(
//                 color: StatusColors.getColor(status, 2),
//                 borderRadius: BorderRadius.circular(6.w),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [StatusCard(status: status)],
//           ),
//           SizedBox(height: .5.h),
//           DeliveredInfoSection(
//             order: order,
//             status: status,
//             style: AppText.medium18(Colors.black),
//           ),
//           SizedBox(height: 4.w),
//           if (order.notesBefore!.isNotEmpty) ...[
//             SizedBox(height: 4.w),
//             CustomExpantionTile(
//               status: status,
//               title: context.tr(LocaleKeys.overview),
//               data: "${order.notesBefore}",
//             ),
//           ],
//           // if (status == "delivered") ...[
//           //   SizedBox(height: 1.w),
//           //   CustomExpantionTile(
//           //     status: status,
//           //     title: "Order overview after",
//           //     data: "${order.notesBefore}",
//           //   ),
//           // ],
//           SizedBox(height: 2.w),
//           DeliveredFileSection(status: status, order: order),
//           // const Spacer(),
//           SizedBox(height: 4.w),
//           if (status != "delivered")
//             ElevatedButton(
//               onPressed: onPressed,
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: StatusColors.getColor(status, 2),
//                 backgroundColor: StatusColors.getColor(status, 1),
//               ),
//               child: Text(btnTitle),
//             ),
//         ],
//       ),
//     );
//   }
// }
