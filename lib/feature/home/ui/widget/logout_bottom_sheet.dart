import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:techno_bond_envoy/core/constant/extension.dart';
import '../../../../core/constant/const_string.dart';
import '../../../../core/service/local_service.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../../core/theme/text_theme.dart';
import 'package:easy_localization/easy_localization.dart';

class LogoutgBottomSheet extends StatelessWidget {
  const LogoutgBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(6.w, 0, 6.w, 6.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(context.tr(LocaleKeys.areYouSure), style: AppText.medium17()),
          SizedBox(height: 6.w),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.nav.pop();
                  },
                  child: Text(context.tr(LocaleKeys.cancel)),
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    await LocalService.instance.delete(ConstHive.userKey);
                    if (context.mounted) {
                      context.nav.pushNamedAndRemoveUntil(
                        RoutePath.login,
                        (s) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade50,
                  ),
                  child: Text(context.tr(LocaleKeys.logout)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
