import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../lang/locale_keys.g.dart';
import '../manager/home_cubit.dart';
import 'home_view.dart';
import 'settings_view.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavView extends StatefulWidget {
  const NavView({super.key});

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  int _currentIndex = 0;
  late final PageController _controller;

  static final List<Widget> _pages = [
    const HomeView(),
    const SettingsView(),
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: _currentIndex);
    super.initState();
  }

  static const List<IconData> _icon = [
    Iconsax.home,
    Iconsax.setting_2,
  ];

  static const List<String> _text = [
    LocaleKeys.home,
    LocaleKeys.settings,
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<HomeCubit>(
              create: (_) => HomeCubit(),
            ),
          ],
          child: PageView(
            controller: _controller,
            children: _pages,
            onPageChanged: (val) {
              setState(() {
                _currentIndex = val;
              });
            },
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.w),
          topRight: Radius.circular(4.w),
        ),
        child: GNav(
          onTabChange: (val) {
            setState(() {
              _currentIndex = val;
            });
            _controller.animateToPage(
              _currentIndex,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
            );
          },
          selectedIndex: _currentIndex,
          haptic: true,
          tabBorderRadius: 50,
          tabBackgroundColor: Colors.green.shade100,
          gap: 2.w, // the gap between icon and text
          color: Colors.black, // unselected icon color
          activeColor: Colors.black, // selected icon and text color
          iconSize: 20.sp, // tab button icon size
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.w),
          backgroundColor: Colors.green.shade50,
          tabMargin: Platform.isIOS
              ? EdgeInsets.fromLTRB(
                  6.w,
                  0,
                  6.w,
                  3.w,
                )
              : EdgeInsets.fromLTRB(6.w, 0, 6.w, 2.w),
          textStyle: AppText.medium15(),
          duration: const Duration(milliseconds: 300),
          tabs: List.generate(
            _pages.length,
            (i) => GButton(text: context.tr(_text[i]), icon: _icon[i]),
          ),
        ),
      ),
    );
  }
}
