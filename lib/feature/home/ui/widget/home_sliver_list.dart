import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/failure_widget.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../../core/theme/text_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../details/ui/widget/show_details.dart';
import '../manager/home_manager/home_cubit.dart';
import 'list_item.dart';
import 'card_loading.dart';

class HomeSliverList extends StatelessWidget {
  const HomeSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          final orders = state.data.orders;
          if (orders != null && orders.isNotEmpty) {
            return ListView.separated(
              itemCount: orders.length,
              padding: EdgeInsets.all(6.w),
              itemBuilder: (_, index) {
                return ListItem(
                  status: "available",
                  order: orders[index],
                  onTap: () {
                    showDetails(
                      context,
                      order: orders[index],
                      status: "available",
                      isAvaliable: context.read<HomeCubit>().isCurrent,
                      onPressed: () async {
                        // await context
                        //     .read<AcceptOrderCubit>()
                        //     .acceptOrder(orders[index].id);
                      },
                    );
                  },
                );
              },
              separatorBuilder: (_, index) => SizedBox(height: 3.w),
            );
          } else {
            return Column(
              spacing: 3.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 3.w),
                Icon(Iconsax.folder_cloud, size: 38.sp),
                Text(
                  context.tr(LocaleKeys.noAvailable),
                  style: AppText.medium16(Colors.grey.shade600),
                ),
              ],
            );
          }
        } else if (state is HomeLoading || state is HomeInitial) {
          return ListView.separated(
            itemCount: 6,
            padding: EdgeInsets.all(6.w),
            itemBuilder: (_, index) => const CardLoading(),
            separatorBuilder: (_, index) => SizedBox(height: 3.w),
          );
        } else if (state is HomeFailure) {
          return SliverToBoxAdapter(child: FailureWidget(error: state.error));
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
