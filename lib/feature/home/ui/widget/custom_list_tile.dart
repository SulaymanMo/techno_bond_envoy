import 'dart:ui';

import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/text_theme.dart';
import 'package:easy_localization/easy_localization.dart';

import 'lang_bottom_sheet.dart';
import 'logout_bottom_sheet.dart';

class CustomListTiles extends StatelessWidget {
  const CustomListTiles({super.key});

  static const List<IconData> _icon = [
    Iconsax.language_square,
    Iconsax.logout,
  ];

  static const List<String> _title = [
    "language",
    "logout",
  ];
  static const List<String> _subtitle = [
    "langSubtitle",
    "logoutSubtitle",
  ];

  static const List<Widget> _sheet = [
    LangBottomSheet(),
    LogoutgBottomSheet(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        _icon.length,
        (i) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.w),
          child: ListTile(
            subtitle: Text(
              context.tr(_subtitle[i]),
              style: AppText.regular15(),
            ),
            tileColor: Colors.green.shade100,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: _sheet[i],
                ),
              );
            },
            title: Text(
              context.tr(_title[i]),
              style: AppText.medium15(),
            ),
            leading: Icon(_icon[i]),
          ),
        ),
      ),
    );
  }
}
