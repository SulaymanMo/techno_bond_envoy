import 'package:sizer/sizer.dart';
import '../theme/text_theme.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final String error;
  const FailureWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(6.w),
      children: [
        Center(child: Icon(Iconsax.danger, size: 38.sp)),
        SizedBox(height: 3.w),
        Text(
          error,
          textAlign: TextAlign.center,
          style: AppText.medium16(Colors.grey.shade600),
        ),
      ],
    );
  }
}
