import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:techno_bond_envoy/core/constant/extension.dart';
import 'package:techno_bond_envoy/core/service/local_service.dart';
import '../../../../core/common/failure_widget.dart';
import '../../../../core/constant/const_string.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../../core/theme/text_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../details/widget/show_details.dart';
import '../manager/home_cubit.dart';
import 'list_item.dart';
import 'card_loading.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (_, state) async {
        if (state is HomeFailure && state.error == "403") {
          await LocalService.instance.delete(ConstHive.userKey);
          if (context.mounted) {
            context.nav.pushNamedAndRemoveUntil(
              RoutePath.login,
              (_) => false,
            );
          }
        }
      },
      builder: (context, state) {
        if (state is HomeSuccess) {
          final orders = state.data.orders;
          // print(orders?.length);
          if (orders != null && orders.isNotEmpty) {
            return ListView.separated(
              itemCount: orders.length,
              padding: EdgeInsets.all(6.w),
              itemBuilder: (_, index) {
                return ListItem(
                  order: orders[index],
                  onTap: () {
                    showDetails(
                      context,
                      order: orders[index],
                      status: orders[index].status,
                      isAvaliable: context.read<HomeCubit>().isCurrent,
                      onPressed: () {},
                    );
                  },
                );
              },
              separatorBuilder: (_, index) => SizedBox(height: 3.w),
            );
          } else {
            return ListView(
              padding: EdgeInsets.all(6.w),
              children: [
                Icon(Iconsax.folder_cloud, size: 38.sp),
                SizedBox(height: 3.w),
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
        } else if (state is HomeFailure && state.error != "403") {
          return FailureWidget(error: state.error);
        } else {
          return ListView(children: const []);
        }
      },
    );
  }
}
