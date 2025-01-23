import 'package:sizer/sizer.dart';
import '../theme/text_theme.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final String error;
  const FailureWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 3.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3.w),
          Icon(Iconsax.danger, size: 38.sp),
          Text(
            error,
            style: AppText.medium16(Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
