import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../../core/theme/text_theme.dart';
import 'package:easy_localization/easy_localization.dart';

import '../manager/home_manager/home_cubit.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 8.w, left: 6.w, right: 6.w),
        child: Row(
          spacing: 3.w,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 1.25.w,
              height: 3.h,
              decoration: BoxDecoration(
                // color: StatusColors.getColor("available", 1),
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4.w),
              ),
            ),
            Text(
              context.tr(LocaleKeys.availableOrders),
              style: AppText.semi16(Colors.grey.shade600),
            ),
            const Spacer(),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeSuccess) {
                  return Text(
                    "${context.tr(LocaleKeys.results)} ${context.read<HomeCubit>().ordersLength}",
                    style: AppText.medium15(Colors.grey.shade700),
                  );
                } else if (state is HomeInitial || state is HomeLoading) {
                  return Text(
                    "${context.tr(LocaleKeys.counting)}...",
                    style: AppText.medium15(Colors.grey.shade700),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
