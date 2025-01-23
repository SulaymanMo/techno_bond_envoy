import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../data/model/order_model.dart';
import '../../../../core/constant/colory.dart';
import '../../../../core/common/info_section.dart';

class ListItem extends StatelessWidget {
  final String status;
  final OrderModel order;
  final void Function()? onTap;

  const ListItem({
    super.key,
    required this.status,
    required this.onTap,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: StatusColors.getColor(status, 0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: InfoSection(status: status, order: order),
        ),
      ),
    );
  }
}
