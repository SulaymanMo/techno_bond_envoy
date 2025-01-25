import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:techno_bond_envoy/core/constant/extension.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/constant/const_string.dart';
import 'package:easy_localization/easy_localization.dart';

class LangBottomSheet extends StatelessWidget {
  const LangBottomSheet({super.key});
  static const List<Locale> _langs = [ConstLang.en, ConstLang.ar];
  static const List<String> _title = ["English", "العربية"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _langs.length,
      shrinkWrap: true,
      padding: EdgeInsets.fromLTRB(6.w, 0, 6.w, 6.w),
      itemBuilder: (_, index) {
        return ListTile(
          onTap: () async {
            if (context.locale == _langs[index]) return;
            await context.setLocale(_langs[index]);
            if (context.mounted) context.nav.pop();
          },
          leading: const Icon(Iconsax.language_square),
          title: Text(_title[index], style: AppText.medium15()),
        );
      },
    );
  }
}
