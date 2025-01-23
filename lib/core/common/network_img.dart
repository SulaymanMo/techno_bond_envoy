import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImg extends StatelessWidget {
  final String? url;
  final double? width, height;
  const NetworkImg(
    this.url, {
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(50.w),
      child: CachedNetworkImage(
        imageUrl: url ?? "",
        width: width,
        height: height,
        fit: BoxFit.fill,
        errorListener: (_) {
          return;
        },
        placeholder: (_, __) => SizedBox(
          width: width,
          height: height,
        ),
        errorWidget: (_, __, ___) => Center(
          child: Icon(Iconsax.image, size: 32.sp, color: Colors.green.shade700),
        ),
      ),
    );
  }
}
