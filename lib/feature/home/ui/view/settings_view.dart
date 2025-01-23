import 'package:sizer/sizer.dart';
import '../../../../core/theme/text_theme.dart';
import '../widget/welcome_appbar.dart';
import 'package:flutter/material.dart';
import '../widget/custom_list_tile.dart';
import '../../../../lang/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/home_cubit.dart';
import '../../../../core/common/network_img.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<HomeCubit>();
    final user = read.getUser();
    return Column(
      children: [
        WelcomeAppBar(
          subtitle: context.tr(LocaleKeys.updateInfo),
          title: "${context.tr(LocaleKeys.accountSettings)} ⚙️",
        ),
        SizedBox(height: 3.w),
        const Spacer(flex: 1),
        CircleAvatar(
          backgroundColor: Colors.green.shade50,
          radius: 20.w,
          child: NetworkImg(user?.image),
        ),
        SizedBox(height: 4.w),
        Text(user!.name, style: AppText.medium17(Colors.grey.shade600)),
        Text(user.phone, style: AppText.medium16(Colors.grey.shade600)),
        SizedBox(height: 3.w),
        const Spacer(flex: 2),
        const CustomListTiles(),
        const Spacer(flex: 2),
        SizedBox(height: 3.w),
      ],
    );
  }
}
