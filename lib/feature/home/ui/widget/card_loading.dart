import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CardLoading extends StatelessWidget {
  const CardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade300,
      child: SizedBox(
        height: 16.h,
        width: double.infinity,
        child: const Card(),
      ),
    );
  }
}
