import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constant/colory.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../home/data/model/order_model.dart';

class Notice extends StatelessWidget {
  final String status;
  final OrderModel order;
  const Notice({super.key, required this.order, required this.status});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (order.notesBefore.isNotEmpty)
              ReadMoreText(
                order.notesBefore,
                moreStyle: AppText.bold15(
                  StatusColors.getColor(status, 2),
                ),
                lessStyle: AppText.bold15(
                  StatusColors.getColor(status, 2),
                ),
                style: AppText.regular16(),
              ),
          ],
        ),
      ),
    );
  }
}
