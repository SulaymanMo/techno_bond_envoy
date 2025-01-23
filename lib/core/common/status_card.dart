import '../constant/colory.dart';
import '../theme/text_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../helper/determine_status.dart';

class StatusCard extends StatelessWidget {
  final String status;
  const StatusCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        // border: Border.all(),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: StatusColors.getColor(status, 1),
          )
        ],
      ),
      child: Text(
        getLocalizedStatus(status),
        overflow: TextOverflow.ellipsis,
        style: AppText.bold15().copyWith(
          color: StatusColors.getColor(status, 2),
        ),
      ),
    );
  }

  // String _capitalize() => status[0].toUpperCase() + status.substring(1);
}
