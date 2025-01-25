import '../widget/notice.dart';
import 'package:sizer/sizer.dart';
import '../widget/file_section.dart';
import 'package:flutter/material.dart';
import '../../../lang/locale_keys.g.dart';
import '../../../core/constant/colory.dart';
import '../../../core/theme/text_theme.dart';
import '../../../core/common/status_card.dart';
import '../../home/data/model/order_model.dart';
import '../../../core/common/info_section.dart';
import 'package:easy_localization/easy_localization.dart';

class DetailsBottomSheet extends StatelessWidget {
  final bool isAvailable;
  final OrderModel order;
  final void Function() onPressed;

  const DetailsBottomSheet({
    super.key,
    required this.order,
    required this.onPressed,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.w, right: 6.w),
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
                color: StatusColors.getColor(order.status, 2),
                borderRadius: BorderRadius.circular(4.w),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [StatusCard(status: order.status)],
          ),
          SizedBox(height: 1.h),
          InfoSection(
            order: order,
            style: AppText.medium18(Colors.black),
          ),
          SizedBox(height: 2.w),
          FileSection(order: order),
          SizedBox(height: 4.w),
          Text(context.tr(LocaleKeys.overview), style: AppText.medium16()),
          SizedBox(height: 2.w),
          Notice(order: order),
        ],
      ),
    );
  }
}
