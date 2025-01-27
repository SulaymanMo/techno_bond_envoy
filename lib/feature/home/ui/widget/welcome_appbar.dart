import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/text_theme.dart';

class WelcomeAppBar extends StatelessWidget {
  final String title;
  final String? subtitle;
  const WelcomeAppBar({super.key, required this.title, this.subtitle});

  String _formatDate() {
    final DateTime date = DateTime.now();
    final String day = DateFormat('d').format(date);
    final String month = DateFormat('MMMM').format(date);
    final String weekday = DateFormat('E').format(date);

    return '$day $month, $weekday';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 6.w,
        left: 6.w,
        right: 6.w,
        bottom: 4.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            subtitle ?? _formatDate(),
            style: AppText.medium15().copyWith(
              fontSize: 16.5.sp,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            title,
            style: AppText.semi20(),
          ),
        ],
      ),
    );
  }
}
